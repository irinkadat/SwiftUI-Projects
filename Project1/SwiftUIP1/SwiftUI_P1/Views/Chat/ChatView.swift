//
//  ChatView.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 22.05.24.
//

import SwiftUI

struct ChatView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ChatViewModel
    
    // MARK: - Initialiser
    init(viewModel: ChatViewModel = ChatViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Button
            Button(action: {
                viewModel.toggleBackground()
            }) {
                Circle()
                    .fill(Color("IconFrameBackground"))
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image("chat")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    )
                    .padding(.leading, 16)
                    .padding(.top, 12)
                
            }
            
            // MARK: - Title Text
            Text("ჯუზონები და რამე")
                .foregroundColor(.white)
                .font(.system(size: 9))
                .padding(.leading, 16)
        }
        .frame(width: 170, height: 110, alignment: .topLeading)
        .background(Color(viewModel.backgroundColor))
        .cornerRadius(18)
        .overlay (
            
            // MARK: - Message Icon Image
            Image("messageIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 90)
                .padding([.bottom, .trailing], 0),
            alignment: .bottomTrailing
        )
    }
}

#Preview {
    ChatView()
}
