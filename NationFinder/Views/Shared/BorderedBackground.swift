//
//  BorderedBackground.swift
//  YourCountryApp
//
//  Created by Mohamed Elkilany on 04/02/2025.
//

import SwiftUI

struct BorderedBackground: ViewModifier {
    var cornerRadius: CGFloat = 8
    var borderColor: Color = .gray
    var borderWidth: CGFloat = 0.2
    var backgroundColor: Color = .white
    
    func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: borderWidth)
                }
            )
    }
}
