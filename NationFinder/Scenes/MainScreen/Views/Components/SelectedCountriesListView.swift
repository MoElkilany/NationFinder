//
//  OnlyFiveCountriesView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct SelectedCountriesListView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView{
            VStack(spacing: 12) {
                if viewModel.selectedCountriesList.isEmpty {
                    Spacer()
                    Image(.emptyView)
                    Text(AppConstants.AppText.onlyFiveCountries)
                        .foregroundColor(.color808080)
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    ForEach(viewModel.selectedCountriesList, id: \.self) { item in
                        SelectedCountriesRowView(country: item)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.selectedCountry = item
                                viewModel.isCountryDetailVisible = true
                            }
                    }
             
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 400)
        .padding()
        .borderedBackground()
    }
}
