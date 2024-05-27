//
//  ContentViewModel.swift
//  SwiftUI_P1
//
//  Created by Irinka Datoshvili on 23.05.24.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isIconYellow = false
    var backgroundColor: String {
        return isIconYellow ? "YellowBackground" : "BlueBackground"
    }
    
    // MARK: - Methods
    func toggleIconColor() {
        isIconYellow.toggle()
    }
}
