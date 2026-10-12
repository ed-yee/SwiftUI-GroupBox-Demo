//
//  Header.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct Header: View {
    let osVersion = UIDevice.current.systemVersion
    let osName = UIDevice.current.systemName

    var body: some View {
        Text(DeviceInfo.info())
        
        VStack(spacing: 30) {
            GroupBox {
                Text("No header")
            }
            
            GroupBox("Header") {
                Text("Content")
            }

            GroupBox("With *Markdown* Header") {
                Text("Content")
            }
            
            GroupBox {
                VStack(alignment: .leading){
                    Text("Content")
                }
            } label: {
                Text("Colored \(Text("Header").foregroundStyle(.blue))")
                    .foregroundStyle(.red)
            }

            GroupBox {
                VStack(alignment: .leading) {
                    Text("• Content")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            } label: {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "gear")
                        Text("Fancy Header")
                    }
                    .font(.title2)
                    Text("Subheader")
                        .font(.title3).italic().foregroundStyle(.blue)
                }
            }

        }
        .navigationTitle(Route.header.description)

    }
}

#Preview {
    Header()
}
