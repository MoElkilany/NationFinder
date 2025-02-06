//
//  CountryFlagView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//



import SwiftUI
struct CountryFlagView: View {
    let flagURL: String?
    
    var body: some View {
        AsyncImage(url: URL(string: flagURL ?? "" )) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            Image(.flagPlaceholder)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .cornerRadius(12)
    }
}
