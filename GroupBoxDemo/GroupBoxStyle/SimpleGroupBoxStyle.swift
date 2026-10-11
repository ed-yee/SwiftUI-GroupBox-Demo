//
//  SimpleGroupBoxStyle.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct SimpleGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
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
        .background(.gbBgColorLightEven)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
