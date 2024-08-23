//
//  FavoriteMovie.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 09.06.24.
//

import Foundation
import SwiftData

@Model
class FavoriteMovie: Identifiable {
    @Attribute(.unique) var id: Int
    var title: String
    var releaseDate: String
    var posterPath: String?
    var backdropPath: String?
    var voteAverage: Double
    var originalLanguage: String
    var genreIDs: [Int]
    var overview: String
    var runtime: Int?
    var popularity: Double
    
    init(id: Int, title: String, releaseDate: String, posterPath: String, backdropPath: String, voteAverage: Double, originalLanguage: String, genreIDs: [Int], overview: String, runtime: Int, popularity: Double) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.voteAverage = voteAverage
        self.originalLanguage = originalLanguage
        self.genreIDs = genreIDs
        self.overview = overview
        self.runtime = runtime
        self.popularity = popularity
    }
}
