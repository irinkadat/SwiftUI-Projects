//
//  CachedImageView.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

// MARK: - CachedImageView
struct CachedImageView: View {
    @StateObject private var viewModel: CachedImageViewModel
    
    init(url: URL) {
        _viewModel = StateObject(wrappedValue: CachedImageViewModel(url: url))
    }
    
    var body: some View {
        Group {
            if let imageData = viewModel.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                ProgressView()
            }
        }
    }
}
