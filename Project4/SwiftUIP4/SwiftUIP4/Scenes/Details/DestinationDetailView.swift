//
//  DestinationDetailView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct DestinationDetailView: View {
    @StateObject private var viewModel: DestinationDetailViewModel
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    init(destination: Destination, coordinator: NavigationCoordinator) {
        _viewModel = StateObject(wrappedValue: DestinationDetailViewModel(destination: destination, coordinator: coordinator))
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.paths) {
            VStack {
                // MARK: - Image Carousel
                TabView {
                    ForEach(viewModel.imageUrls, id: \.self) { url in
                        CachedImageView(url: url)
                            .frame(height: 300)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300)
                
                // MARK: - Destination Description
                Text(viewModel.destination.description)
                    .padding()
                
                // MARK: - Navigation Buttons
                navigationButtons
            }
            .navigationTitle(viewModel.destination.name)
            .navigationDestination(for: Screens.self) { screen in
                coordinator.navigate(to: screen)
            }
        }
    }
    
    // MARK: - Navigation Buttons
    var navigationButtons: some View {
        VStack {
            Button(action: {
                viewModel.goToTransport()
            }) {
                Text("Transport")
            }
            
            Button(action: {
                viewModel.goToMustSee()
            }) {
                Text("Must See")
            }
            
            Button(action: {
                viewModel.goToHotels()
            }) {
                Text("Hotels")
            }
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}
