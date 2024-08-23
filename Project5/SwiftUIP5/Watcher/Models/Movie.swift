//
//  Movie.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import Foundation

struct Movie: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double
    let originalLanguage: String
    let genreIDs: [Int]
    let overview: String
    let runtime: Int?
    let popularity: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case originalLanguage = "original_language"
        case genreIDs = "genre_ids"
        case overview
        case runtime
        case popularity
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
