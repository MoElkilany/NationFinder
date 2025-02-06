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
    
    private static func makeCountryRepository() -> CountryRepositoryImpl {
        let apiService = makeAPIService()
        return CountryRepositoryImpl(apiService: apiService)
    }
    
    private static func makeAPIService() -> APIServices {
        let networkManager = NetworkManagerImpl()
        let decoder = DataDecoderImpl()
        let router = CountriesRouterImpl()
        return APIServicesImpl(
            networkManager: networkManager,
            decoder: decoder,
            router: router
        )
    }
    
}

