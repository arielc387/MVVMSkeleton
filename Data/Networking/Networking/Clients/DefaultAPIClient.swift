//
//  DefaulltAPIClient.swift
//  Data
//
//  Created by Ariel Calderon Solis on 04/09/23.
//

import Foundation
import Alamofire
import Domain
import Resolver
import Common


public class DefaultAPIClient:APIClientProtocol{
    
    static let shared: DefaultAPIClient = {
        return DefaultAPIClient();
    }()
   
    static let H_RETRY = "H-Retry";
    static let H_API_KEY = "X-Api-Key";
        
    @Injected private var config:ConfigProtocol;
    
    private lazy var AF:Session = {
        
        if self.session != nil{
            return session!;
        }
        
        return Alamofire.AF;

    }()
    
    var session:Session?
    
    public init(){}
    
    public func execute<ResultType:Decodable>(request: APIRequest,callback: @escaping (AppResult<ResultType>) -> Void) {
        
        guard let resource = request.resource else {
            callback(.failure(.invalidRequestError(reason: "INVALID REQUEST".localized)))
            return;
        }
        
        AF.request(self.getUrl(resource: resource), method: HTTPMethod(rawValue: request.method.rawValue), parameters: request.params, encoding: self.getParameterEncoding(method: request.method), headers: self.parseHeaders(headers: request.headers,request: request),interceptor: self).validate().responseDecodable(of:ResultType.self) { response in
            switch response.result {
            case .success:
                
                guard let value = response.value else{
                    callback(.failure(.apiError(code: -1, reason: "UNKNOWN_ERROR".localized)))
                    return
                }
                
                callback(.success(value));
                break;
            case .failure(let error):
                
                callback(.failure(self.parseError(error:error,data: response.data)));
                
                break;
            }
        }
        
    }
    
}

extension DefaultAPIClient
{
    
    private func getParameterEncoding(method:HTTPMethods)->ParameterEncoding{
        
        switch method {
        case .GET:
            return URLEncoding.queryString
        default:
            return JSONEncoding.default
        }
        
    }
    
    private func getUrl(resource:APIResources)->String{
        return "\(self.config.baseUrl)/\(resource.relUrl)";
    }
    
    private func parseHeaders(headers:APIHeaders?,request:APIRequest)->HTTPHeaders?{
        
        var httpHeaders = HTTPHeaders();
        
        if let headers = headers {
            
            headers.forEach { (key: String, value: String) in
                httpHeaders.add(name: key, value: value);
            }
            
        }
        
        if let retry = request.shouldRetry, retry{
            httpHeaders.add(self.getRetryHeader());
        }
        
        if let isSecure = request.isSecure, isSecure{
            httpHeaders.add(self.getAPIKeyHeader());
        }
        
        return httpHeaders;
    }
    
    private func getRetryHeader()->HTTPHeader{
        return HTTPHeader(name: DefaultAPIClient.H_RETRY, value: "true");
    }
    
    private func getAPIKeyHeader()->HTTPHeader{
        return HTTPHeader(name: DefaultAPIClient.H_API_KEY, value: self.config.apiKey);
    }
    
    private func parseError(error:AFError,data:Data?)->AppError{
        
      
        var errorReason = error.localizedDescription;
        var errorCode = error._code;
        
        switch error {
        case .responseValidationFailed(let reason):
            
            switch(reason){
            case .unacceptableStatusCode(code: 401):
                return .authError(reason: "AUTHORIZATION FAILED".localized);
            case .unacceptableStatusCode(code: 400):
                errorReason = "BAD REQUEST".localized;
                errorCode = 400;
            case .unacceptableStatusCode(code: 500):
                errorReason = "INTERNAL SERVER ERROR".localized;
                errorCode = 500;
            case .unacceptableStatusCode(code: 404):
                errorReason = "NETWORK NOT REACHABLE".localized;
                errorCode = 404;
            default:
                break;
            }
            
            break;
        case .invalidURL(_):
            errorReason = "INVALID URL".localized;
            break;
        default:
            break;
        }
        
        return .apiError(code: errorCode, reason: errorReason);
    }
    
}

extension DefaultAPIClient: RequestInterceptor{
    
    func shouldRetry(request:Request)->Bool{
        
        guard let headers:HTTPHeaders = request.task?.currentRequest?.headers else {
            return false;
        }
        
        return headers.contains(self.getRetryHeader());
    }
    
    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        let retryLimit = 3;
        let retryDelay = 1.0;
        let shouldRetry = shouldRetry(request: request);
    
        //if already retried
        if(request.retryCount > retryLimit){
            completion(.doNotRetry);
            return;
        }
        
        if shouldRetry {
            completion(.retryWithDelay(retryDelay))
        }else{
            completion(.doNotRetry);
        }
        
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let modRequest = urlRequest
        
        //modify request if needed
        
        completion(.success(modRequest))
    }

}
