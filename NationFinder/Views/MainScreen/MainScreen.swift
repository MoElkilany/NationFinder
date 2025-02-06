//
//  MainScreen.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 03/02/2025.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject private var viewModel: MainViewModel
    @StateObject private var locationManager = LocationManager()

        init(countries: [CountryModel]) {
            _viewModel = StateObject(
                wrappedValue: MainViewModel(countries: countries)
            )
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.colorF5F5F5.cgColor)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    SearchBarView(viewModel:viewModel)
//                    SearchBarView(viewModel: SearchBarViewModel(openSearch: viewModel.openSearch)  )
                    DefaultCountryView(viewModel: viewModel)
                    AdditionalCountriesView(viewModel: viewModel)
                    OnlyFiveCountriesView(viewModel: viewModel)
                    AddCountryButton(viewModel: viewModel)
                }
                .padding(16)
            }
            .navigationDestination(isPresented: $viewModel.isShowingCountryDetail) {
                if let selectedCountry = viewModel.selectedCountry {
                    CountryDetailScreen(selectedCountry: selectedCountry)
                }
            }
        }
        .onChange(of:locationManager.userCountry) { _ , newValue in
            print("the user country is : \(newValue)")
            viewModel.currentCountry = newValue
        }
        .sheet(isPresented: $viewModel.openSheet) {
            CountrySelectionSheet(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.openSearch) {
            SearchSheet(viewModel: viewModel)
        }
    }
}




//#Preview {
//    MainScreen(
//        countries: [CountryModel(
//            name: "fdfd",
//            capital: "ss",
//            currencies: [Currency(
//                code: "dd",
//                name: "ss",
//                symbol: "ss"
//            ) ],
//            latlng: [
//                12.2,
//                12.2
//            ],
//            flags: FlagsModel(
//                svg: "sfs",
//                png: "|dsds"
//            )
//        )]
//    )
//}


