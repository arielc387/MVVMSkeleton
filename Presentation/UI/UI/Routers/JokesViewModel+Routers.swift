//
//  JokesViewModel+Routers.swift
//  UI
//
//  Created by Ariel Calderon Solis on 15/09/23.
//

import Foundation
import Resolver

extension JokesViewModel {
    
    public func showJokesView(){
        
        let jokesViewBuilder:JokesViewBuilder = Resolver.resolve()
        
        guard let jokesView = jokesViewBuilder.makeJokesView() else{
            return;
        }
        
        self.router.route(by:.push, to: jokesView, from: self.view);
        
    }
    
}
