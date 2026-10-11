//
//  Multilevel.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct Multilevel: View {
    let osVersion = UIDevice.current.systemVersion
    let osName = UIDevice.current.systemName

    var body: some View {
        Text("\(osName) \(osVersion)")
        
        VStack(spacing: 30) {
            Text("Basic nested GroupBox")
                .frame(maxWidth: .infinity, alignment: .leading)
            GroupBox("Top Level") {
                Text("This is a top level item")
                
                GroupBox("Level 2") {
                    Text("This is a level 2 item")

                    GroupBox("Level 3") {
                        Text("This is a level 3 item")
                    }
                }
            }
            
            Text("Apply custom GroupBoxStyle")
                .frame(maxWidth: .infinity, alignment: .leading)
            GroupBox("Top Level") {
                Text("This is a top level item")
                
                GroupBox("Level 2") {
                    Text("This is a level 2 item")

                    GroupBox("Level 3") {
                        Text("This is a level 3 item")
                    }
                    .groupBoxStyle(SimpleGroupBoxStyle())
                }
                .groupBoxStyle(SimpleGroupBoxStyle())
            }
            .groupBoxStyle(SimpleGroupBoxStyle())
        }
        .navigationTitle(Route.multilevel.description)

    }
}

#Preview {
    Multilevel()
}
