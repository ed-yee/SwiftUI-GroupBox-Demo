//
//  GroupBoxNestingLevelKey.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct GroupBoxNestingLevelKey: EnvironmentKey {
    static var defaultValue: Int = 0 // Default value for the outermost GroupBox
}

extension EnvironmentValues {
    var groupBoxNestingLevel: Int {
        // Get value
        get { self[GroupBoxNestingLevelKey.self] }
        // Set value
        set { self[GroupBoxNestingLevelKey.self] = newValue }
    }
}
