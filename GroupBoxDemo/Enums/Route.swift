//
//  Route.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/11/26.
//

import Foundation

enum Route: Hashable, CaseIterable, Identifiable {
    case basic
    case header
    case multilevel
    case customization
    case customMultilevel
    
    var id: Self { self }

    var description: String {
        switch self {
        case .basic:
            "Basic"
        case .header:
            "Header"
        case .multilevel:
            "Multilevel"
        case .customization:
            "Customization"
        case .customMultilevel:
            "Customized Multilevel"
        }
    }
}
