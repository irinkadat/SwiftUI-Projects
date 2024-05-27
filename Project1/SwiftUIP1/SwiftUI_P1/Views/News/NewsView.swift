//
//  NewsView.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 22.05.24.
//

import SwiftUI

struct NewsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: NewsViewModel
    
    // MARK: - Initialiser
    init(viewModel: NewsViewModel = NewsViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // MARK: - Button
            Button(action: {
                viewModel.toggleBackground()
            }) {
                Circle()
                    .fill(Color("IconFrameBackground"))
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image("person")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    )
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
            }
            
            // MARK: - Text
            Text("ცეცხლოვანი სიახლეები")
                .foregroundColor(.white)
                .font(.system(size: 9))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 88))
                .lineLimit(2)
        }
        .frame(width: 170, height: 110, alignment: .topLeading)
        .background(Color(viewModel.backgroundColor))
        .cornerRadius(18)
        .overlay(
            // MARK: - Speaker Image
            Image("speaker")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 90)
                .padding([.bottom, .trailing], 0),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    NewsView()
}
