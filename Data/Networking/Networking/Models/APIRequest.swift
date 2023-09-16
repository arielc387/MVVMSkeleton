//
//  APIRequest.swift
//  Data
//
//  Created by Ariel Calderon Solis on 04/09/23.
//

import Foundation

public class APIRequest{
    
    var method:HTTPMethods
    var resource:APIResources?
    var params:APIParams?
    var headers: APIHeaders?
    var shouldRetry:Bool?
    var isSecure:Bool?
    
    public init() {
        method = .GET;
        shouldRetry = false;
        isSecure = true;
    }
    
    public func with(method: HTTPMethods) -> APIRequest {
        self.method = method
        return self
    }
    
    public func with(resource: APIResources) -> APIRequest {
        self.resource = resource
        return self
    }
    
    public func with(params: APIParams) -> APIRequest {
        self.params = params
        return self
    }
    
    public func with(headers: APIHeaders) -> APIRequest {
        self.headers = headers
        return self
    }
    
    public func with(shouldRetry: Bool) -> APIRequest {
        self.shouldRetry = shouldRetry
        return self
    }
  
    public func with(isSecure: Bool) -> APIRequest {

        self.isSecure = isSecure
        return self
    }
    
  
}
