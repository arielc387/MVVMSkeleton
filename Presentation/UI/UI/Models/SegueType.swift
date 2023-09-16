//
//  SegueType.swift
//  UI
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

public enum SegueType {
    case push
    case set
    case present(completion:(()->())?)
    case setRoot
}
