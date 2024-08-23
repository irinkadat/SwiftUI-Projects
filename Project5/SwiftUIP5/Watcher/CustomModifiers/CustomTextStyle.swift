//
//  customTextStyle.swift
//  Watcher
//
//  Created by Irinka Datoshvili on 08.06.24.
//

import SwiftUI

extension View {
    func customTextStyle(fontSize: CGFloat) -> some View {
        self.modifier(CustomTitleStyleModifier(fontSize: fontSize))
    }
}
