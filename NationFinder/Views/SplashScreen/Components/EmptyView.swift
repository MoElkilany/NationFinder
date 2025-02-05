//
//  EmptyView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 100, height: 100)
            Text("There is No Data")
                .font(.headline)
                .padding()
        }
    }
}