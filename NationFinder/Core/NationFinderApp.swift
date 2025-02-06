//
//  NationFinderApp.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import SwiftUI
import SwiftData

@main
struct NationFinderApp: App {
    var body: some Scene {
        WindowGroup {
            Factory.makeSplashView()
        }
    }
}


struct Factory {
    static func makeSplashView()-> some View {
        let view = SplashScreen(viewModel: makeSplashViewModel() )
        return view
    }
    
    
    static func makeSplashViewModel()-> SplashViewModel {
        let endPoint = EndPoint()
        let decoder = DataDecoder()
        let networkManager = NetworkManager()
        let apiService = APIServices(networkManager: networkManager, decoder: decoder, endPoint: endPoint)
        let repository = CountryRepository(apiService: apiService)
        let viewModel = SplashViewModel(repository: repository )
        return viewModel
        
    }
    
    
}
