//
//  MoviesViewModel.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import Foundation
import Networking

class MoviesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var movies: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var query: String = ""
    private var networkService = NetworkService()
    @Published var selectedMovie: Movie?
    
    init() {
        fetchGenres()
    }
    
    // MARK: - Methods
    func fetchMovies() {
        networkService.getData(urlString: "https://api.themoviedb.org/3/movie/popular?api_key=9fc9ddce090de61a09c793226f8f1514") { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    self.movies = movieResponse.results
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchGenres() {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=9fc9ddce090de61a09c793226f8f1514"
        
        networkService.getData(urlString: urlString) { (result: Result<GenreResponse, Error>) in
            switch result {
            case .success(let genreResponse):
                DispatchQueue.main.async {
                    self.genres = genreResponse.genres
                    self.fetchMovies()
                }
            case .failure(let error):
                print("Failed to fetch genres: \(error.localizedDescription)")
            }
        }
    }
    
    func genreNames(for movie: Movie) -> [String] {
        return movie.genreIDs.compactMap { id in
            genres.first { $0.id == id }?.name
        }
    }
    
    func posterURL(for movie: Movie) -> URL? {
        guard let posterPath = movie.posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    func convertToMovie(_ favoriteMovie: FavoriteMovie) -> Movie {
        Movie(id: favoriteMovie.id, title: favoriteMovie.title, releaseDate: favoriteMovie.releaseDate, posterPath: favoriteMovie.posterPath ?? "", backdropPath: favoriteMovie.backdropPath ?? "", voteAverage: favoriteMovie.voteAverage, originalLanguage: favoriteMovie.originalLanguage, genreIDs: favoriteMovie.genreIDs, overview: favoriteMovie.overview, runtime: favoriteMovie.runtime ?? 0, popularity: favoriteMovie.popularity)
    }
    
    func convertToFavoriteMovie(_ movie: Movie) -> FavoriteMovie {
        return FavoriteMovie(id: movie.id, title: movie.title, releaseDate: movie.releaseDate, posterPath: movie.posterPath ?? "", backdropPath: movie.backdropPath ?? "", voteAverage: movie.voteAverage, originalLanguage: movie.originalLanguage, genreIDs: movie.genreIDs, overview: movie.overview, runtime: movie.runtime ?? 0, popularity: movie.popularity)
    }
}

