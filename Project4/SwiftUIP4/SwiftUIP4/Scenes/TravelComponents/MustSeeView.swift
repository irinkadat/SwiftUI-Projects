//
//  MustSeeView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct MustSeeView: View {
    let mustSeeInfo: [String]
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            List(mustSeeInfo, id: \.self) { item in
                Text(item)
            }
            
            Button("Go to main screen") {
                coordinator.popToRoot()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .navigationTitle("Must See")
    }
}
