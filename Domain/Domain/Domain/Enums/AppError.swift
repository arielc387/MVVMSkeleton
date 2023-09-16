//
//  AppError.swift
//  Domain
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

public enum AppError: Error,CustomStringConvertible {
   
    case apiError(code: Int, reason:String)
    case invalidRequestError(reason:String)
    case authError(reason:String)

    public var description: String {
            switch self {
                
            case .apiError(_, let reason):
                    return reason
            case .invalidRequestError(reason: let reason):
                    return reason
            case .authError(reason: let reason):
                    return reason
            
            }
        
        }
}
