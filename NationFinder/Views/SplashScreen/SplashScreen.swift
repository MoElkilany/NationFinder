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
            
            VStack {
                Text("Nation Finder")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                switch viewModel.splashState {
                case .loading:
                    LoadingView()
                case .loaded:
                    EmptyView() 
                case .error(let message):
                    ErrorView(message: message)
                case .empty:
                    EmptySplashView()
                }
            }
        }
        .fullScreenCover(isPresented: $showMainScreen) {
             MainScreen(countries: viewModel.countries)
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
