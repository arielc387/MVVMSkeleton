//
//  DI.swift
//  OrchestratorApp
//
//  Created by Ariel Calderon Solis on 15/09/23.
//

import Foundation
import Resolver
import Networking
import Repositories
import Domain
import UI
import Common

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        
        
        //Repositories
        register { JokeRepository() }.implements(JokeRepositoryProtocol.self);
        
        //Networking
        register { DefaultAPIClient() }.implements(APIClientProtocol.self);
       
        //Config
        register { Config() }.implements(ConfigProtocol.self);
        
        //Routers
        register { DefaultRouter() }.implements(RouterProtocol.self);
        
        //ViewBuilders
        register { JokesViewBuilder() }.implements(JokesViewBuilderProtocol.self);
        
    }
}

