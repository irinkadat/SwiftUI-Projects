//
//  NetworkManager.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation

// MARK: - Network Manager
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Fetch travel data
    func fetchTravelData(completion: @escaping (Result<TravelData, Error>) -> Void) {
        guard let url = URL(string: "https://mocki.io/v1/f5ab9d04-25fe-4f26-bcb2-a53ef1a8c6fb") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let travelData = try JSONDecoder().decode(TravelData.self, from: data)
                completion(.success(travelData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
