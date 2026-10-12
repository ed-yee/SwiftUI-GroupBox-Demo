//
//  Customization.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct GroupBoxStyleView: View {
    let osVersion = UIDevice.current.systemVersion
    let osName = UIDevice.current.systemName
    
    var body: some View {
        Text(DeviceInfo.info())
        
        GroupBox {
            VStack(alignment: .leading) {
                Text("• Complex header with fancy header")
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
                    .font(.title3)
                    .italic()
                    .foregroundStyle(.subheaderBlue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .groupBoxStyle(SimpleGroupBoxStyle())
        .padding(.vertical)
        .navigationTitle(Route.customization.description)

    }
}

#Preview {
    GroupBoxStyleView()
}
