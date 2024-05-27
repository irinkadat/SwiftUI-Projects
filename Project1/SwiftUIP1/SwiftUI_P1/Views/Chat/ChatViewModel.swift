//
//  ChatViewModel.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 23.05.24.
//

import Foundation

final class ChatViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isPurpleBackground = false
    var backgroundColor: String {
        return isPurpleBackground ? "PurpleBackground" : "OrangeBackground"
    }
    
    // MARK: - Methods
    func toggleBackground() {
        isPurpleBackground.toggle()
    }
}
