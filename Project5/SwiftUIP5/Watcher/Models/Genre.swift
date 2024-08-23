//
//  Genre.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 08.06.24.
//

import Foundation

struct Genre: Decodable, Hashable {
    let id: Int
    let name: String
}

struct GenreResponse: Decodable {
    let genres: [Genre]
}
