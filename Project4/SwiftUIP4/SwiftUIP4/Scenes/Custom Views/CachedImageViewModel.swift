//
//  CachedImageViewModel.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import Foundation
import Combine

class CachedImageViewModel: ObservableObject {
    @Published var imageData: Data? = nil
    private var url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
        loadImage()
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    private func loadImage() {
        let key = url.absoluteString
        
        if let cachedData = ImageCacheManager.shared.getImageData(forKey: key) {
            self.imageData = cachedData
        } else {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .catch { _ in Just(nil) }
                .receive(on: DispatchQueue.main)
                .sink { [weak self] data in
                    guard let self = self else { return }
                    if let data = data {
                        self.imageData = data
                        ImageCacheManager.shared.setImageData(data, forKey: key)
                    }
                }
        }
    }
}
