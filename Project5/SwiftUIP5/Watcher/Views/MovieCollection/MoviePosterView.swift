//
//  MoviePosterView.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 07.06.24.
//

import SwiftUI

struct MoviePosterView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 104, height: 146)
            .cornerRadius(16)
            
            Text(movie.title)
                .font(.custom("Poppins-Medium", size: 12))
                .frame(width: 100, height: 36)
        }
    }
}

