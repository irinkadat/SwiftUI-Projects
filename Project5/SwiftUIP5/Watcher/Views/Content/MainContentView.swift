//
//  MainContentView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 07.06.24.
//

import SwiftUI

struct MainContentView: View {
    @State private var selectedTab = 0
    @StateObject private var favoritesManager = FavoritesManager()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                MoviesCollectionView()
                    .tabItem {
                        Image(selectedTab == 0 ? "homeFill" : "home")
                        Text("Home")
                    }
                    .tag(0)
                
                SearchPageView()
                    .tabItem {
                        Image(selectedTab == 1 ? "searchFill" : "search2")
                        Text("Search")
                    }
                    .tag(1)
                FavoritesView()
                    .tabItem {
                        Image(selectedTab == 2 ? "saveFill" : "save")
                        Text("Favorites")
                    }
                    .tag(2)
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(.customBackground, for: .tabBar)
        }
        .accentColor(.customBlue)
        .environmentObject(favoritesManager)
    }
}

#Preview {
    MainContentView()
}
