//
//  SplashViewModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 03/02/2025.
//

import Foundation

class SplashViewModel: ObservableObject {
    
    @Published private(set) var countries: [CountryModel] = []
    @Published private(set) var splashState: SplashState = .loading

    private let repository: CountryRepository
     
     init(repository: CountryRepository) {
         self.repository = repository
     }
     
    @MainActor
    func fetchCountries() {
        Task {
            do {
                let countryData = try await repository.getCountries()
                handleSuccess(with: countryData)
            } catch {
                handleFailure(message: error is AppError ? "Error: \(error)" : AppConstants.AppError.internalServerError)
            }
        }
    }
    

    private func handleSuccess(with countryData: [CountryModel]) {
        if countryData.isEmpty {
            splashState = .empty
        } else {
            countries = countryData
            splashState = .loaded
        }
    }

    private func handleFailure(message: String) {
        splashState = .error(message)
    }

}

