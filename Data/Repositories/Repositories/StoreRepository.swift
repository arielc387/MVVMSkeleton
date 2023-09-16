//
//  JokeRepository.swift
//  Data
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation
import Domain
import Networking

public class JokeRepository:BaseRepository,JokeRepositoryProtocol{
   
    public func getJokes(limit:Int = 1, callback: @escaping (Domain.AppResult<[Domain.JokeModel]>) -> Void) {
        
        let request = APIRequest()
            .with(method:.GET)
            .with(resource:.jokes)
            .with(params: ["limit":limit])
        
        self.client.execute(request: request,callback:callback);
        
    }
    
}
