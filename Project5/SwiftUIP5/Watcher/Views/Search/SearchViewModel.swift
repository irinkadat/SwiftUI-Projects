//
//  SearchViewModel.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 05.06.24.
//

import Foundation
import Networking

class SearchViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var query: String = "" {
        didSet {
            if query.isEmpty {
                isSearchPerformed = false
                filteredMovies = []
            }
        }
    }
    @Published var filteredMovies: [Movie] = []
    @Published var selectedCriteria: String = "Name"
    @Published var genreMap: [String: Int] = [:]
    @Published var isSearchPerformed = false
    @Published var hasResults = true
    
    // MARK: - Private Properties
    private var networkService = NetworkService()
    
    // MARK: - Initializer
    init() {
        fetchGenres()
    }
    
    // MARK: - Methods
    func searchMovies() {
        guard !query.isEmpty else {
            resetSearch()
            return
        }
        
        isSearchPerformed = true
        let urlString = createSearchURL()
        
        networkService.getData(urlString: urlString) { (result: Result<MovieResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let movieResponse):
                    self.filteredMovies = movieResponse.results
                    self.hasResults = !self.filteredMovies.isEmpty
                case .failure(let error):
                    self.hasResults = false
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func fetchGenres() {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=9fc9ddce090de61a09c793226f8f1514"
        
        networkService.getData(urlString: urlString) { (result: Result<GenreResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let genreResponse):
                    self.genreMap = Dictionary(uniqueKeysWithValues: genreResponse.genres.map { ($0.name, $0.id) })
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func mapGenreNameToID(_ name: String) -> Int? {
        return genreMap[name]
    }
    
    // MARK: - Helper Methods
    private func resetSearch() {
        filteredMovies = []
        hasResults = true
    }
    
    private func createSearchURL() -> String {
        let baseURL = "https://api.themoviedb.org/3"
        let apiKey = "9fc9ddce090de61a09c793226f8f1514"
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        switch selectedCriteria {
        case "Year":
            return "\(baseURL)/discover/movie?api_key=\(apiKey)&primary_release_year=\(encodedQuery)"
        case "Genre":
            if let genreID = mapGenreNameToID(query) {
                return "\(baseURL)/discover/movie?api_key=\(apiKey)&with_genres=\(genreID)"
            }
            return "\(baseURL)/search/movie?api_key=\(apiKey)&query=\(encodedQuery)"
        default:
            return "\(baseURL)/search/movie?api_key=\(apiKey)&query=\(encodedQuery)"
        }
    }
}

