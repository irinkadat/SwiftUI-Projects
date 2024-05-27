//
//  ContentView.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 25.05.24.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @StateObject private var viewModel = GroceryViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
            
            VStack() {
                Text("Products")
                    .font(.system(size: 20))
                    .padding(.leading, 24)
                    .padding(.vertical, 20)
            }
            
            ProductsScrollView()
                .environmentObject(viewModel)
            FooterView()
                .environmentObject(viewModel)
        }
        .background(Color("CustomBackground"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
