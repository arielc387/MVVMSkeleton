//
//  JokeRepositoryProtocol.swift
//  Domain
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation


public protocol JokeRepositoryProtocol{
    
    func getJokes(limit:Int,callback:@escaping (AppResult<[JokeModel]>)->Void)

}
