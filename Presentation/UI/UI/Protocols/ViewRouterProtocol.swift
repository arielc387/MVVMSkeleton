//
//  ViewRouterProtocol.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation


public protocol ViewRouterProtocol:AnyObject{
    
    func navigate(to view:ViewRouterProtocol)->Bool
    func set(view:ViewRouterProtocol)->Bool
    func present(view:ViewRouterProtocol,completion: (()->())?)->Bool
    func back()->Bool;
    func dismiss(completion: (() -> Void)?) -> Bool
    func set(root view:ViewRouterProtocol)->Bool
    
    func open(url:URL)->Bool;
    func canHandle(view:ViewRouterProtocol)->Bool
}
