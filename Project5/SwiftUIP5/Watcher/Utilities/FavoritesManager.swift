//
//  FavoritesManager.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 09.06.24.
//

import Foundation
import SwiftData

class FavoritesManager: ObservableObject {
    @Published var favoriteMovies: [FavoriteMovie] = []
    
    func addFavorite(_ movie: FavoriteMovie, context: ModelContext) {
        context.insert(movie)
        saveContext(context)
    }
    
    func removeFavorite(_ movie: FavoriteMovie, context: ModelContext) {
        //        context.delete(movie)
        if let index = favoriteMovies.firstIndex(where: { $0.id == movie.id }) {
            context.delete(favoriteMovies[index])
        }
        saveContext(context)
    }
    
    func isFavorite(_ movie: FavoriteMovie) -> Bool {
        favoriteMovies.contains(where: { $0.id == movie.id })
    }
    
    private func saveContext(_ context: ModelContext) {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error.localizedDescription)")
        }
    }
    
    func updateFavorites(context: ModelContext) {
        let fetchRequest = FetchDescriptor<FavoriteMovie>()
        do {
            favoriteMovies = try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch favorites: \(error.localizedDescription)")
        }
    }
}
