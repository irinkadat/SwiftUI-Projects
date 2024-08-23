//
//  HotelsView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct HotelsView: View {
    let hotels: [Destination.Hotel]
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            // MARK: - Hotels List
            List(hotels, id: \.name) { hotel in
                VStack(alignment: .leading) {
                    Text(hotel.name)
                    Text("Price Range: \(hotel.priceRange.formatted(.currency(code: "USD")))")
                    Text("Rating: \(hotel.rating)")
                }
            }
            Button("Go to main screen") {
                coordinator.popToRoot()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .navigationTitle("Hotels")
    }
}


