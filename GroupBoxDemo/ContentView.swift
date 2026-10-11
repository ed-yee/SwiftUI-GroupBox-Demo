//
//  ContentView.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var router = RouteCoordinator()
    @State private var selectedPage: Route?
    
    init() {}
    
    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .basic:
            Basic()
        case .header:
            Header()
        case .multilevel:
            Multilevel()
        case .customization:
            GroupBoxStyleView()
        case .customMultilevel:
            CustomMultilevel()
        }
    }
    
    var body: some View {
        // GOAL: Create a navigation that works on all form factors
        
        NavigationSplitView {
            List(Route.allCases, id: \.id, selection: $selectedPage) { route in
                NavigationLink(route.description, value: route)
            }
            .navigationTitle("GroupBox")

        } detail: {
            if let selectedPage = selectedPage {
                destination(for: selectedPage)
            }
        }
        .environment(router)
    }
}

#Preview {
    ContentView()
}
