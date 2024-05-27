//
//  SongView.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 22.05.24.
//

import SwiftUI

struct SongView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: SongViewModel
    
    // MARK: - Initialiser
    init(viewModel: SongViewModel = SongViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // MARK: - Button
            Button(action: {
                viewModel.toggleAlternateText()
            }) {
                Circle()
                    .fill(Color("IconFrameBackground"))
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image("mic")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    )
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
            }
            
            // MARK: - Title Text
            Text("ჯუზონები და რამე")
                .foregroundColor(.white)
                .font(.system(size: 9))
                .padding(EdgeInsets(top: 2, leading: 16, bottom: 0, trailing: 0))
            
            Spacer().frame(height: 52)
            
            // MARK: - Song Text
            Text(viewModel.songText)
                .foregroundColor(.white)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .lineLimit(4)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 36))
        }
        .frame(width: 170, height: 232, alignment: .topLeading)
        .background(Color("YellowBackground"))
        .cornerRadius(18)
        .overlay(
            
            // MARK: - Guitar Image
            Image("guitar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 74, height: 182)
                .padding([.bottom, .trailing], 0),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    SongView()
}
