//
//  Basic.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI
import Playgrounds

struct Basic: View {
    let osVersion = UIDevice.current.systemVersion
    let osName = UIDevice.current.systemName
    let deviceName = UIDevice.current.model
    
    var body: some View {
        Text(DeviceInfo.info())
        Text("\(deviceName) \(osName) \(osVersion)")
        
        GroupBox {
            VStack(alignment: .leading) {
                Text("A simple `GroupBox`")
                
                // NOTE: Using "+" to concatenates two text views is deprecrated
                // Source: https://developer.apple.com/documentation/swiftui/text/+(_:_:)
                Text("With \(Text("colorful").foregroundStyle(.red)) text")
            }
        }
        .navigationTitle(Route.basic.description)
    }
}

#Preview {
    Basic()
}

#Playground {
    print(UIDevice.current.systemVersion)
}
