//
//  GroceryViewModel.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 26.05.24.
//

import Foundation

// MARK: - ViewModel

class GroceryViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Apple", price: 0.5, image: "apple", stock: 10),
        Product(name: "Avocado", price: 0.3, image: "avocado", stock: 0),
        Product(name: "Corn", price: 0.2, image: "corn", stock: 15),
        Product(name: "Strawberry", price: 0.2, image: "strawberry", stock: 15),
        Product(name: "Brocoli", price: 0.3, image: "brocoli", stock: 0),
        Product(name: "cherries", price: 0.2, image: "cherries", stock: 15),
        Product(name: "Orange", price: 0.5, image: "orange", stock: 10),
        Product(name: "Kiwi", price: 0.3, image: "kiwi", stock: 0),
        Product(name: "Potato", price: 0.5, image: "potato", stock: 10)
    ]
    
    @Published var discount: Double = 0.0
    
    // MARK: - Helper methods
    
    var totalQuantity: Int {
        products.reduce(0) { $0 + $1.quantity }
    }
    
    var totalPrice: Double {
        products.reduce(0) { $0 + $1.price * Double($1.quantity) * (1 - discount / 100) }
    }
    
    func addProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }), products[index].stock > 0 {
            products[index].quantity += 1
            products[index].stock -= 1
        }
    }
    
    func subtractProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }), products[index].quantity > 0 {
            products[index].quantity -= 1
            products[index].stock += 1
        }
    }
    
    func deleteProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].stock += products[index].quantity
            products[index].quantity = 0
        }
    }
    
    func applyDiscount(_ discount: Double) {
        self.discount = discount
    }
    
    // MARK: - View Interaction Methods
    
    func canSubtractProduct(_ product: Product) -> Bool {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            return products[index].quantity > 0
        }
        return false
    }
    
    func canAddProduct(_ product: Product) -> Bool {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            return products[index].stock > 0
        }
        return false
    }
    
    func isProductOutOfStock(_ product: Product) -> Bool {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            return products[index].stock == 0
        }
        return false
    }
}

