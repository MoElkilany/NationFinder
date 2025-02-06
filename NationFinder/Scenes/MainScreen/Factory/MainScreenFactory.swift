//
//  MainScreenFactory.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 06/02/2025.
//


import SwiftUI

struct MainScreenFactory {
    
    static func makeMainScreen(countries: [CountryModel]) -> some View {
        let viewModel = makeMainViewModel(countries: countries)
        return MainScreen(viewModel: viewModel)
    }
    
    private static func makeMainViewModel(countries: [CountryModel]) -> MainViewModel {
        return MainViewModel(countries: countries)
    }
}
