//
//  CountryInfoView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//



import SwiftUI
struct CountryInfoView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 0) {
            TitleRowView(title: title)
            HStack {
                TitleRowView(title: value, titleColor: .color808080)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .borderedBackground(backgroundColor: .colorF5F5F5)
        }
    }
}
