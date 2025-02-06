//
//  SearchTextFieldView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import SwiftUI

struct SearchTextFieldView: View {
    @State private var searchText = ""
    var searchAction: (String) -> Void
    
    var body: some View {
        HStack(spacing: 4) {
            TextField(AppConstants.AppText.searchForCountry, text: $searchText)
                .padding(8)
                .padding(.horizontal, 32)
                .frame(height: 50)
                .borderedBackground()
                .overlay(
                    HStack {
                        Image(.searchIcon)
                            .padding(.horizontal,8)
                        Spacer()
                    }
                )
                .foregroundColor(.color0B0C26)
                .onChange(of: searchText) { _, newValue in
                    searchAction(newValue)
                }

            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Text(AppConstants.AppText.cancel)
                        .foregroundColor(.color0B0C26)
                }
                .padding(.trailing, 10)
            }
        }
    }
}
