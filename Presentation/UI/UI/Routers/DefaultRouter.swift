//
//  DefaultRouter.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation
import Domain
import Resolver

public struct DefaultRouter:RouterProtocol{
    
    public init(){}
    
    public func route(by segue:SegueType,to view:ViewRouterProtocol,from context: ViewRouterProtocol?){
        
        if let fromView = context, !fromView.canHandle(view: view){
            assertionFailure("Incompatible route");
            return;
        }
        
        switch segue {
            
        case .push:
    
            _ = context?.navigate(to: view)
            
            break;
            
        case .set:
            
            _ = context?.set(view:view)
            
            break;
            
        case .present(let completion):
            
            _ = context?.present(view: view, completion: completion)
            
            break;
        case .setRoot:
            
            _ = context?.set(root: view);
            
            break;
        }
        
    }
    
}
