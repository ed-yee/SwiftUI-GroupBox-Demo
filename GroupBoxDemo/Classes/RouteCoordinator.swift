//
//  RouteCoordinator.swift
//  GroupBoxDemo
//
//  Created by Edward Yee on 10/11/26.
//

import SwiftUI

@MainActor
@Observable
final class RouteCoordinator {
    var path: [Route] = []

    func show(_ route: Route) {
        guard path.last != route else { return }
        path.append(route)
    }

    func back() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func backToRoot() {
        path.removeAll()
    }
}
