//
//  SplashFactory.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 06/02/2025.
//



import SwiftUI
struct SplashFactory {
    
    static func makeSplashView()-> some View {
        let view = SplashScreen(viewModel: makeSplashViewModel() )
        return view
    }
    
    private static func makeSplashViewModel() -> SplashViewModel {
        let repository = makeCountryRepository()
        return SplashViewModel(repository: repository)
    }
    
    private static func makeCountryRepository() -> CountryRepository {
        let apiService = makeAPIService()
        return CountryRepository(apiService: apiService)
    }
    
    private static func makeAPIService() -> APIServices {
        let networkManager = NetworkManager()
        let decoder = DataDecoder()
        let router = CountriesRouterImpl()
        return APIServices(
            networkManager: networkManager,
            decoder: decoder,
            router: router
        )
    }
    
}

