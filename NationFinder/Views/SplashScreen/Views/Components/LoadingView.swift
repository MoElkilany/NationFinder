//
//  LoadingView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .foregroundColor(.white)
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .padding()
    }
}