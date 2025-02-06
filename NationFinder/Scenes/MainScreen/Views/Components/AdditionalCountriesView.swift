//
//  AdditionalCountriesView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import SwiftUI
struct AdditionalCountriesView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            Text(AppConstants.AppText.additionalCountry)
                .foregroundColor(.color0B0C26)
            Spacer()
            Button {
                viewModel.clearSelectedCountries()
            } label: {
                Image(viewModel.selectedCountriesList.isEmpty ? .grayRecycleBin : .redRecycleBin)
            }
        }
    }
}
