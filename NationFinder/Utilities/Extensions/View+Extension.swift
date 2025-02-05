//
//  View+Extension.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//

import SwiftUI

extension View {
    func borderedBackground(
        cornerRadius: CGFloat = 8,
        borderColor: Color = .gray,
        borderWidth: CGFloat = 0.2,
        backgroundColor: Color = .white
    ) -> some View {
        modifier(
            BorderedBackground(
                cornerRadius: cornerRadius,
                borderColor: borderColor,
                borderWidth: borderWidth,
                backgroundColor: backgroundColor
            )
        )
    }
}
