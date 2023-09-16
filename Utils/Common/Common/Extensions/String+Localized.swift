//
//  String+Localized.swift
//  Common
//
//  Created by Ariel Calderon Solis on 10/09/23.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
