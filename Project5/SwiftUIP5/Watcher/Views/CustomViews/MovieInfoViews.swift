//
//  MovieInfoViews.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 07.06.24.
//

import SwiftUI

// MARK: - Movie custom badge
struct BadgeView<Content>: View where Content: CustomStringConvertible {
    var imageName: String
    var content: Content
    var foregroundColor: Color = .primary
    var systemImage: Bool = false
    
    var body: some View {
        HStack {
            if systemImage {
                Image(systemName: imageName)
                    .foregroundColor(foregroundColor)
            } else {
                Image(imageName)
                    .foregroundColor(foregroundColor)
            }
            Text(content.description)
        }
    }
}

// MARK: - Movie Genres
struct MovieGenres: View {
    var genres: [String]
    
    var body: some View {
        HStack {
            Image("ticket")
            Text(genres.joined(separator: ", "))
        }
    }
}

// MARK: - Movie Title
struct CustomTitleStyleModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-SemiBold", size: fontSize))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
}

