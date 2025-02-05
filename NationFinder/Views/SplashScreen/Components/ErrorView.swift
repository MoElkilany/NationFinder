//
//  ErrorView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import SwiftUI

struct ErrorView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.red)
            .padding()
    }
}