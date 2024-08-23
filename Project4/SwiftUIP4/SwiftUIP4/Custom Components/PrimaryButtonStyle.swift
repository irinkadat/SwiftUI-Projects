//
//  PrimaryButtonStyle.swift
//  SwiftUIP4
//
//  Created by Irinka Datoshvili on 29.05.24.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .lineLimit(2)
            .frame(width: 110, height: 40)
            .font(.system(size: 12))
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .lineLimit(2)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(18)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .shadow(color: Color(.gray), radius: 3)
    }
}
