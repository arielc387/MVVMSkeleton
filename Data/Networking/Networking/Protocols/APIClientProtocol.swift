//
//  APIClientProtocol.swift
//  Data
//
//  Created by Ariel Calderon Solis on 04/09/23.
//

import Foundation
import Domain

public protocol APIClientProtocol{
    
    func execute<ResultType:Decodable>(request: APIRequest,callback:@escaping (_ result:AppResult<ResultType>)->Void)

}
