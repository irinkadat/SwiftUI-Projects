//
//  MovieDetailView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 07.06.24.
//

import SwiftUI
import SwiftData

struct MovieDetailView: View {
    var movie: Movie
    @ObservedObject var viewModel: MoviesViewModel
    @State private var isFavorite: Bool = false
    @Environment(\.modelContext) private var context: ModelContext
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                MovieDetailCover(movie: movie)
                movieDetails
                aboutMovieSection
            }
        }
        .padding(.top, 20)
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(.customBackground)
        .onAppear {
            isFavorite = favoritesManager.isFavorite(viewModel.convertToFavoriteMovie(movie))
            favoritesManager.updateFavorites(context: context)
        }
    }
    
    // MARK: - Movie Details
    private var movieDetails: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    BadgeView(imageName: "calendarBlank", content: movie.releaseDate.prefix(4))
                    Text(" | ")
                    MovieGenres(genres: viewModel.genreNames(for: movie))
                    Text(" | ")
                    BadgeView(imageName: "globe.europe.africa", content: movie.popularity, systemImage: true)
                }
                .font(.custom("Montserrat-medium", size: 12))
                .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
    
    // MARK: - About Movie Section
    private var aboutMovieSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                Text("About Movie")
                    .font(.custom("Poppins-Medium", size: 14))
                
                Spacer()
                
                Button(action: {
                    toggleFavorite()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            }
            
            Divider()
                .frame(height: 4)
                .background(.dividerBackground)
            
            Text(movie.overview)
                .font(.custom("Poppins-Regular", size: 12))
                .padding(.top, 10)
        }
        .padding(.horizontal, 29)
        .padding(.top, 16)
    }
    
    private func toggleFavorite() {
        let favoriteMovie = viewModel.convertToFavoriteMovie(movie)
        if isFavorite {
            favoritesManager.removeFavorite(favoriteMovie, context: context)
        } else {
            favoritesManager.addFavorite(favoriteMovie, context: context)
        }
        isFavorite.toggle()
        favoritesManager.updateFavorites(context: context)
    }
}
