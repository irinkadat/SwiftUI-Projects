//
//  DestinationDetailViewModel.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation

final class DestinationDetailViewModel: ObservableObject {
    @Published var destination: Destination
    @Published var imageUrls: [URL] = []
    @Published var transportInfo: (local: String, international: String)
    @Published var mustSeeInfo: [String]
    var coordinator: NavigationCoordinator
    
    init(destination: Destination, coordinator: NavigationCoordinator) {
        self.destination = destination
        self.transportInfo = (local: destination.transport.local, international: destination.transport.international)
        self.mustSeeInfo = destination.mustSee
        self.imageUrls = destination.detailImages.compactMap { URL(string: $0) }
        self.coordinator = coordinator
    }
    
    func goToTransport() {
        coordinator.push(.transport(local: transportInfo.local, international: transportInfo.international))
    }
    
    func goToMustSee() {
        coordinator.push(.mustSee(mustSeeInfo))
    }
    
    func goToHotels() {
        coordinator.push(.hotels(destination.hotels))
    }
}
