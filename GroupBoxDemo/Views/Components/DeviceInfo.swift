//
//  DeviceInfo.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/10/26.
//

import SwiftUI

struct DeviceInfo {
    static let osVersion = UIDevice.current.systemVersion
    static let osName = UIDevice.current.systemName
    static let deviceName = UIDevice.current.model
    
    static func info() -> String {
        "\(deviceName) \(osName) \(osVersion)"
    }

//    var body: some View {
//        Text("\(deviceName) \(osName) \(osVersion)")
//    }
}

//#Preview {
//    DeviceInfo()
//}
