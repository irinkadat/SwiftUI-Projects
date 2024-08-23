//
//  ContentView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    
    // MARK: - Body
    var body: some View {
        Group {
            if isActive {
                MainContentView()
            } else {
                SplashScreenView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
