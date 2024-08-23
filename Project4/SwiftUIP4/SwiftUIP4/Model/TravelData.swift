//
//  TravelData.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation

// MARK: - Destination Model
struct Destination: Identifiable, Decodable , Hashable{
    let id: Int
    let name: String
    let mainImageUrl: String
    let detailImages: [String]
    let description: String
    let transport: Transport
    let mustSee: [String]
    let hotels: [Hotel]
    
    struct Transport: Decodable, Hashable {
        let local: String
        let international: String
    }
    
    struct Hotel: Decodable, Hashable {
        let name: String
        let priceRange: Double
        let rating: Int
    }
}

// MARK: - Tips Model
struct Tips: Decodable {
    let tips: [String]
}

// MARK: - Top Level Model
struct TravelData: Decodable {
    let destinations: [Destination]
    let tips: [String]
}
