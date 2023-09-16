//
//  BaseRepository.swift
//  Data
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation


import Foundation
import Domain
import Resolver
import Networking

public class BaseRepository{
    
    @Injected private(set) var client : APIClientProtocol;
    
    public init(){
    }

}
