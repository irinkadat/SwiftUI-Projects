//
//  TransportView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct TransportView: View {
    let local: String
    let international: String
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Local")
                    Spacer()
                    Text(local)
                }
                HStack {
                    Text("International")
                    Spacer()
                    Text(international)
                }
            }
            .listStyle(GroupedListStyle())
            
            Button("Go to main screen") {
                coordinator.popToRoot()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .padding(.top, 20)
        .navigationTitle("Transport")
    }
}
