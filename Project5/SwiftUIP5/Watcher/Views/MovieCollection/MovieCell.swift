//
//  MovieCell.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import SwiftUI

struct MovieCell: View {
    @ObservedObject var viewModel = MoviesViewModel()
    var movie: Movie
    
    var body: some View {
        HStack(spacing: 12) {
            moviePoster
                .frame(width: 95, height: 120)
                .cornerRadius(16)
            
            movieTextInfo
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color(.customBackground))
        .cornerRadius(10)
    }
    
    // MARK: - Movie Poster
    private var moviePoster: some View {
        AsyncImage(url: viewModel.posterURL(for: movie)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }
    }
    
    // MARK: - Movie Text Info
    private var movieTextInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(movie.title)
                .font(.custom("Poppins-Regular", size: 16))
                .lineLimit(1)
            
            BadgeView(imageName: "star", content: String(format: "%.1f",movie.voteAverage), foregroundColor: .orange)
                .font(.system(size: 12))
                .foregroundColor(.orange)
            
            Group {
                MovieGenres(genres: viewModel.genreNames(for: movie))
                
                BadgeView(imageName: "calendarBlank", content: movie.releaseDate.prefix(4))
                
                BadgeView(imageName: "globe.europe.africa", content: movie.popularity, systemImage: true)
            }
            .font(.custom("Montserrat-medium", size: 12))
            .foregroundColor(.secondary)
        }
    }
}

