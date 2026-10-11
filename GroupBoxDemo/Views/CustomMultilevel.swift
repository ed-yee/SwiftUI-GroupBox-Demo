//
//  CustomMultilevel.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/10/26.
//

import SwiftUI

struct CustomMultilevel: View {
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("• Complex header with fancy header")
                Text("• Customize `GroupBox`")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            GroupBox("Another GroupBox") {
                VStack(alignment: .leading){
                    Text("• Just a standard `GroupBox`")
                    
                    GroupBox("Yet Another GroupBox") {
                        Text("• Nothing special")
                    }
                    .groupBoxStyle(CustomGroupBoxStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .groupBoxStyle(CustomGroupBoxStyle())
            
            GroupBox("Another GroupBox 2") {
                VStack(alignment: .leading){
                    Text("• Just a standard `GroupBox`")
                    
                    GroupBox("Yet Another GroupBox 2") {
                        Text("• Nothing special")
                        
                        GroupBox("A deeper GroupBox") {
                            Text("• Getting deeper")
                        }
                        .groupBoxStyle(CustomGroupBoxStyle())
                    }
                    .groupBoxStyle(CustomGroupBoxStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .groupBoxStyle(CustomGroupBoxStyle())
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "gear")
                    Text("Fancy Header")
                }
                .font(.title2)
                Text("Subheader")
                    .font(.title3)
                    .italic()
                    .foregroundStyle(.subheaderBlue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .groupBoxStyle(CustomGroupBoxStyle())
        .navigationTitle(Route.customMultilevel.description)

    }
}

#Preview {
    CustomMultilevel()
}
