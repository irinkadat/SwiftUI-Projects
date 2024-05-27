//
//  ProductModel.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 26.05.24.
//

import Foundation

// MARK: - Product Model

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var price: Double
    var image: String
    var stock: Int
    var quantity: Int = 0
}
