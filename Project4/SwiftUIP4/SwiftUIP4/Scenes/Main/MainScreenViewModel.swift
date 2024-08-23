//
//  MainScreenViewModel.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    @Published var tips: [String] = []
    @Published var tipMessage = ""
    @Published var showingTip = false
    let coordinator: NavigationCoordinator
    
    init(coordinator: NavigationCoordinator) {
        self.coordinator = coordinator
        fetchTravelData()
    }
    
    private func fetchTravelData() {
        NetworkManager.shared.fetchTravelData { [weak self] result in
            switch result {
            case .success(let travelData):
                DispatchQueue.main.async {
                    self?.destinations = travelData.destinations
                    self?.tips = travelData.tips
                }
            case .failure(let error):
                print("Failed to fetch travel data: \(error)")
            }
        }
    }
    
    func showTravelTip() {
        if let tip = tips.randomElement() {
            tipMessage = tip
            showingTip = true
        }
    }
    
    func imageUrl(for destination: Destination) -> URL {
        return URL(string: destination.mainImageUrl)!
    }
    
    func goToDetails(_ destination: Destination) -> DestinationDetailView {
        return DestinationDetailView(destination: destination, coordinator: coordinator)
    }
}
