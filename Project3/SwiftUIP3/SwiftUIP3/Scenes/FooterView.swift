//
//  FooterView.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 26.05.24.
//

import SwiftUI

// MARK: - Footer

struct FooterView: View {
    @EnvironmentObject var viewModel: GroceryViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Items: \(viewModel.totalQuantity)")
                    Text("Total Price: \(viewModel.totalPrice.formatted(.currency(code: "USD")))")
                }
                .font(.system(size: 16))
                Spacer()
                Button(action: { viewModel.applyDiscount(20.0) }) {
                    Text("20% Discount")
                        .lineLimit(2)
                        .font(.system(size: 12))
                        .padding(.horizontal, 20)
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .background(Color("CustomYellow"))
                        .cornerRadius(12)
                }
                
                Button(action: {
                    UIApplication.shared.open(URL(string: "https://www.google.com")!)
                }) {
                    Text("Payment")
                        .padding()
                        .font(.system(size: 14))
                        .background(Color("CustomBlue"))
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .cornerRadius(10)
                        .shadow(color: Color("CustomBlue"), radius: 5)
                }
            }
            .padding(.horizontal, 30)
            .frame(height: 100)
            .background(Color("HeaderBackground"))
            .cornerRadius(8)
        }
        .background(Color("HeaderBackground"))
        .edgesIgnoringSafeArea(.bottom)
    }
}
