//
//  ProductsScrollView.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 26.05.24.
//

import SwiftUI

// MARK: - List of products

struct ProductsScrollView: View {
    @EnvironmentObject var viewModel: GroceryViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(viewModel.products) { product in
                    ZStack(alignment: .topTrailing) {
                        HStack {
                            productInfo(image: product.image, name: product.name, price: product.price)
                            
                            Spacer()
                            
                            productControls(product)
                            deleteProduct(product)
                        }
                        .padding()
                        .frame(height: 110)
                        .background(viewModel.isProductOutOfStock(product) ? Color.gray.opacity(0.2) : Color("CellBackground"))
                        .cornerRadius(14)
                        .padding(.horizontal)
                        
                        if viewModel.isProductOutOfStock(product) {
                            outOfStockBadge
                        }
                    }
                }
            }
        }
    }
    
    // MARK: - Out of stock badge
    
    var outOfStockBadge: some View {
        Text("Out of Stock!")
            .foregroundColor(.gray)
            .font(.system(size: 14))
            .padding(.trailing, 32)
            .padding(.top, 10)
    }
    
    // MARK: - Product Details
    
    func productInfo(image: String, name: String, price: Double) -> some View {
        HStack(spacing: 0) {
            Image(image)
                .resizable()
                .frame(width: 104, height: 72)
                .cornerRadius(12)
                .padding(.trailing, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                Text("\(price.formatted(.currency(code: "USD")))")
                    .font(.system(size: 16))
            }
        }
    }
    
    // MARK: - Increase\Decrease product quantity
    
    func productControls(_ product: Product) -> some View {
        HStack {
            Button(action: { viewModel.subtractProduct(product) }) {
                Image(systemName: "minus.circle")
            }
            .disabled(!viewModel.canSubtractProduct(product))
            .foregroundColor(viewModel.canSubtractProduct(product) ? .blue : .gray)
            
            Text("\(product.quantity)")
            
            Button(action: { viewModel.addProduct(product) }) {
                Image(systemName: "plus.circle")
            }
            .disabled(!viewModel.canAddProduct(product))
            .foregroundColor(viewModel.canAddProduct(product) ? .blue : .gray)
        }
    }
    
    // MARK: - Delete button
    
    func deleteProduct(_ product: Product) -> some View {
        Button(action: { viewModel.deleteProduct(product) }) {
            Image(systemName: "trash")
        }
        .disabled(viewModel.isProductOutOfStock(product))
        .foregroundColor(viewModel.isProductOutOfStock(product) ? .gray : .blue)
    }
}

