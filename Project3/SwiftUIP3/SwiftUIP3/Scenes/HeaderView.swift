//
//  HeaderView.swift
//  SwiftUIP3
//
//  Created by Irinka Datoshvili on 26.05.24.
//

import SwiftUI

// MARK: - Header

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Image("grapes")
                    .resizable()
                    .frame(width: 43, height: 43)
                    .padding(.leading, 20)
                    .padding(.trailing, 5)
                
                Text("Fruits & Veggies")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .frame(width: 87)
                
                Spacer()
            }
            .background(Color("HeaderBackground"))
            .cornerRadius(8)
            .padding()
            .frame(height: 100)
        }
        .background(Color("HeaderBackground"))
    }
}
