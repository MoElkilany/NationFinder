//
//  SmallFlagView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct SmallFlagView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(.flagPlaceholder)
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)

        }
        .frame(width: 50, height: 50)
        .cornerRadius(4)
    }
}
