//
//  MainScreenView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct MainScreenView: View {
    @StateObject var coordinator = NavigationCoordinator()
    @StateObject var viewModel: MainScreenViewModel
    
    init() {
        let coordinator = NavigationCoordinator()
        _coordinator = StateObject(wrappedValue: coordinator)
        _viewModel = StateObject(wrappedValue: MainScreenViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.paths) {
            List(viewModel.destinations) { destination in
                NavigationLink(destination: viewModel.goToDetails(destination).transition(.slide)) {
                    destinationItem(destination)
                }
            }
            .navigationTitle("Travel Destinations")
            .padding(.top, 30)
            .toolbar {
                Button("Travel Tips💡") {
                    viewModel.showTravelTip()
                }
            }
            .alert(isPresented: $viewModel.showingTip) {
                Alert(title: Text("Travel Tip"), message: Text(viewModel.tipMessage), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(for: Screens.self) { screen in
                coordinator.navigate(to: screen)
            }
        }
        .environmentObject(coordinator)
    }
    
    // MARK: - Destination item view
    func destinationItem(_ destination: Destination) -> some View {
        HStack(spacing: 20) {
            CachedImageView(url: viewModel.imageUrl(for: destination))
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            destinationInfo(destination.name)
        }
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            0
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
        .listRowSeparatorTint(.gray)
        .padding(.vertical, 5)
    }
    
    // MARK: - Destination information
    func destinationInfo(_ name: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
            Text("tap to see more!")
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    MainScreenView()
}
