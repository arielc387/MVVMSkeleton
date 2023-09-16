//
//  JokesViewBuilder.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

public protocol JokesViewBuilderProtocol:ViewBuilderProtocol{
    
    func makeJokesView()->ViewRouterProtocol?
    
}

public struct JokesViewBuilder:JokesViewBuilderProtocol{
   
    public init(){}
    
    public func makeJokesView() -> ViewRouterProtocol? {
        
        let viewController:JokesViewController = JokesViewController.loadFromNib(name: "JokesView");
        return viewController;
    }
    
}
