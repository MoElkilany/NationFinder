//
//  TitleRowView.swift
//  YourCountryApp
//
//  Created by Mohamed Elkilany on 04/02/2025.
//

import SwiftUI

struct TitleRowView: View {
    let title: String
    var titleColor: Color = .color0B0C26
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(titleColor)
            Spacer()
        }
        .padding(4)
    }
}
