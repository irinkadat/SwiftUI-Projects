//
//  NewsViewModel.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 23.05.24.
//

import Foundation

final class NewsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isBlueBackground = false
    var backgroundColor: String {
        return isBlueBackground ? "PinkBackground" : "GreenBackground"
    }
    
    // MARK: - Methods
    func toggleBackground() {
        isBlueBackground.toggle()
    }
}
