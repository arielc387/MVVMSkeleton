//
//  Config.swift
//  Domain
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

public struct Config:ConfigProtocol {
    
    enum Keys:String {
        case BASE_URL
        case API_KEY
     }
    
    static let shared: Config = {
        return Config();
    }()
    
    public var baseUrl: String = "https://api.api-ninjas.com/v1/"; //TODO read this value from config file
    public var apiKey: String = "API KEY HERE"; //TODO read this value from config file
    
    public init(){
        
    }
    
}
