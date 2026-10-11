//
//  CustomGroupBoxStyle.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct CustomGroupBoxStyle: GroupBoxStyle {
    @Environment(\.groupBoxNestingLevel) var nestingLevel
    @Environment(\.colorScheme) var colorScheme
    
    // Select appropriate group box background color
    var groupBoxBgColor: Color {
        if colorScheme == .dark {
            // Dark
            if nestingLevel % 2 == 0 {
                // Even
                return .gbBgColorDarkEven
            } else {
                // Odd
                return .gbBgColorDarkOdd
            }
        } else {
            // Light
            if nestingLevel % 2 == 0 {
                // Even
                return .gbBgColorLightEven
            } else {
                // Odd
                return .gbBgColorLightOdd
            }
        }
    }
    
    func makeBody(configuration: GroupBoxStyleConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            configuration.label
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(
                            .groupBoxHeaderBg,
                            lineWidth: 5
                        )
                        .background(
                            .groupBoxHeaderBg
                        )
                        .padding(-8)
                )
                .padding(8)

            configuration.content
        }
        .padding(12)
        .background(groupBoxBgColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .environment(\.groupBoxNestingLevel, nestingLevel + 1) // Increment for nested GroupBoxes
    }
}
