//
//  SplashScreen.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import SwiftUI

struct SplashScreen: View {
    @StateObject var viewModel: SplashViewModel
    @State private var showMainScreen = false
    
    init(viewModel: SplashViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.color121441.cgColor)
                .ignoresSafeArea()
            SplashContentView(splashState: viewModel.splashState)
            
                .fullScreenCover(isPresented: $showMainScreen) {
                    MainScreenFactory.makeMainScreen(countries: viewModel.countries)
                }
                .onAppear {
                    viewModel.fetchCountries()
                }
                .onChange(of: viewModel.splashState) { _, newState in
                    if case .loaded = newState {
                        showMainScreen = true
                    }
                }
        }
    }
}
