//
//  MovieDetailCover.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 08.06.24.
//

import SwiftUI

struct MovieDetailCover: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            backdropImage
            posterAndTitle
        }
    }
    
    // MARK: - Backdrop Image
    private var backdropImage: some View {
        ZStack(alignment: .bottomTrailing) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath ?? "")")) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            } placeholder: {
                Color.gray
                    .frame(maxWidth: .infinity)
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
            }
            .frame(height: 210)
            .edgesIgnoringSafeArea(.horizontal)
            
            BadgeView (
                imageName: "star",
                content: String(format: "%.1f",movie.voteAverage),
                foregroundColor: .orange
            )
            .font(.system(size: 12))
            .foregroundColor(.orange)
            .padding(4)
            .background(Color.black.opacity(0.7))
            .cornerRadius(8)
            .padding([.trailing, .bottom], 10)
        }
    }
    
    // MARK: - Poster and Title
    private var posterAndTitle: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 95, height: 120)
            .cornerRadius(16)
            
            VStack() {
                Spacer()
                Text(movie.title)
                    .font(.custom("Poppins-SemiBold", size: 18))
            }
        }
        .padding(.horizontal, 29)
        .padding(.top, -70)
    }
}
