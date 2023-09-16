//
//  RouterProtocol.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

public protocol RouterProtocol{
        
    func route(by segue:SegueType,to view:ViewRouterProtocol,from context: ViewRouterProtocol?)
}
