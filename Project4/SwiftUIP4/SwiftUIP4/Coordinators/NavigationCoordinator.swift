//
//  NavigationCoordinator.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 30.05.24.
//

import Foundation
import SwiftUI

enum Screens: Hashable {
    case details(Destination)
    case transport(local: String, international: String)
    case hotels([Destination.Hotel])
    case mustSee([String])
}

final class NavigationCoordinator: ObservableObject {
    @Published var paths = NavigationPath()
    
    @ViewBuilder
    func navigate(to screen: Screens) -> some View {
        switch screen {
        case .details(let destination):
            DestinationDetailView(destination: destination, coordinator: self)
        case .transport(let local, let international):
            TransportView(local: local, international: international)
        case .hotels(let hotels):
            HotelsView(hotels: hotels)
        case .mustSee(let mustSeeInfo):
            MustSeeView(mustSeeInfo: mustSeeInfo)
        }
    }
    
    func push(_ screen: Screens) {
        paths.append(screen)
    }
    
    func pop() {
        paths.removeLast()
    }
    
    func popToRoot() {
        paths = NavigationPath()
    }
}
