//
//  OnlyFiveCountriesView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct OnlyFiveCountriesView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            if viewModel.selectedFiveCountries.isEmpty {
                Image(.emptyView)
                Text("There’s No Country Added, You Can Add Only 5 Countries.")
                    .font(.caption)
                    .foregroundColor(.color808080)
                    .multilineTextAlignment(.center)
            } else {
                ForEach(viewModel.selectedFiveCountries, id: \.self) { item in
                    OnlyFiveCountryRow(country: item)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedCountry = item
                            viewModel.isShowingCountryDetail = true
                        }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 400)
        .padding()
        .borderedBackground()
    }
}
