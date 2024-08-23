//
//  MoviesCollectionView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import SwiftUI

struct MoviesCollectionView: View {
    @StateObject var viewModel = MoviesViewModel()
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ScrollView {
                    moviesGrid
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .navigationTitle("Movies")
            .onAppear {
                viewModel.fetchGenres()
                viewModel.fetchMovies()
            }
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie, viewModel: viewModel)
            }
            .background(.customBackground)
        }
    }
    
    private var gridColumns: [GridItem] {
        Array(repeating: GridItem(.flexible()), count: 3)
    }
    
    private var moviesGrid: some View {
        LazyVGrid(columns: gridColumns, spacing: 16) {
            ForEach(viewModel.movies, id: \.id) { movie in
                NavigationLink(value: movie) {
                    MoviePosterView(movie: movie)
                }
                .buttonStyle(PlainButtonStyle())
                .aspectRatio(0.75, contentMode: .fit)
            }
        }
    }
}

