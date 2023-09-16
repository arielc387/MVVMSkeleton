//
//  APIResources.swift
//  Data
//
//  Created by Ariel Calderon Solis on 04/09/23.
//

import Foundation

public enum APIResources{
    
    case jokes
    
    var relUrl: String {
        
        switch self{
        case .jokes:
            return "jokes";
        }
        
    }
    
}
