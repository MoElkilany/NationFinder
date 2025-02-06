//
//  SplashContentView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 06/02/2025.
//


import SwiftUI
struct SplashContentView: View {
    let splashState: SplashState
    
    var body: some View {
        
        VStack {
            
            Text(AppConstants.AppText.nationFinder)
                .font(.largeTitle)
                .foregroundColor(.white)
            switch splashState {
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
}
