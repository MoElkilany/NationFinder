//
//  MainScreen.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 03/02/2025.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject  var viewModel: MainViewModel

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.colorF5F5F5.cgColor)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    SearchBarView(viewModel:viewModel)
                    DefaultCountryView(viewModel: viewModel)
                    AdditionalCountriesView(viewModel: viewModel)
                    SelectedCountriesListView(viewModel: viewModel)
                    AddCountryButton(viewModel: viewModel)
                }
                .padding(16)
            }
            .navigationDestination(isPresented: $viewModel.isCountryDetailVisible) {
                if let selectedCountry = viewModel.selectedCountry {
                    CountryDetailsFactory.makeCountryDetails(country: selectedCountry)
                }
            }
        }

        .sheet(isPresented: $viewModel.isCountrySelectionSheetOpen) {
            CountrySelectionSheet(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.isSearchSelectionSheetOpen) {
            SearchSheet(viewModel: viewModel)
        }
    }
}



