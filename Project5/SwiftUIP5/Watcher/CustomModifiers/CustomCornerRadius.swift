//
//  CustomCornerRadius.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 07.06.24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
