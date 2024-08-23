//
//  FavoritesView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 09.06.24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query var favoriteMovies: [FavoriteMovie]
    @ObservedObject var viewModel = MoviesViewModel()
    @EnvironmentObject var favoritesManager: FavoritesManager
    @Environment(\.modelContext) private var context: ModelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                if favoriteMovies.isEmpty {
                    emptyStateView
                } else {
                    List(favoriteMovies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailView(movie: viewModel.convertToMovie(movie), viewModel: viewModel)) {
                            MovieCell(movie: viewModel.convertToMovie(movie))
                        }
                        .buttonStyle(PlainButtonStyle())
                        .swipeActions {
                            Button(role: .destructive) {
                                favoritesManager.removeFavorite(movie, context: context)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Favorites")
            .background(Color.customBackground.ignoresSafeArea())
        }
    }
    
    private var emptyStateView: some View {
        VStack {
            Spacer()
            Text("No Favourites Yet")
                .font(.custom("Montserrat-medium", size: 16))
            Text("All movies marked as favourite will be added here")
                .font(.custom("Montserrat-medium", size: 12))
                .foregroundStyle(.secondary)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
        .background(Color.customBackground)
        .padding()
    }
}
