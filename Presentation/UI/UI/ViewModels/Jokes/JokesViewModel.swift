//
//  JokesViewModel.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation
import Domain
import Resolver
import Common
import Repositories

public class JokesViewModel:BaseViewModel{
    
    @Injected private var repository:JokeRepositoryProtocol
    
    func loadData(){
        
        self.repository.getJokes(limit: 5) { [weak self] result in
            
            guard let self = self else{
                return
            }
            
            switch result {
            case .success(let values):
                self.data = values
            case .failure(let error):
                self.error = error
            }
  
        }
        
    }
    
    func itemsCount()->Int{
        return self.data?.count ?? 0
    }
    
    func dataForItem(at index:Int)->String?{
        
        guard let data = data as? [JokeModel],  data.count > index else{
            return nil
        }
        
        return data[index].joke
    }
    
}
