//
//  SplashViewModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 03/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published private(set) var countries: [CountryModel] = []
    @Published private(set) var splashState: SplashState = .loading

    private let repository: CountryRepository

    init(repository: CountryRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchCountries(modelContext: ModelContext) {
        
        loadLocalCountries(modelContext: modelContext)
        if !countries.isEmpty {
            splashState = .loaded
            return
        }
         Task {
            do {
                let countryData = try await repository.getCountries()
                handleSuccess(with: countryData, modelContext: modelContext)
            } catch {
                handleFailure(message: error is AppError ? "Error: \(error)" : AppConstants.AppError.internalServerError)
            }
        }
    }
    
    private func handleSuccess(with countryData: [CountryModel],modelContext: ModelContext) {
        if countryData.isEmpty {
            splashState = .empty
        } else {
            countries = countryData
            saveLocalData(countries: countryData, modelContext: modelContext)
            splashState = .loaded
        }
    }

    private func handleFailure(message: String) {
        splashState = .error(message)
    }
    
    private func saveLocalData(countries: [CountryModel],modelContext: ModelContext) {
        for country in countries {
            modelContext.insert(country)
        }
        try? modelContext.save()
    }
    
    private func loadLocalCountries(modelContext: ModelContext) {
        let descriptor = FetchDescriptor<CountryModel>()
        if let localCountries = try? modelContext.fetch(descriptor) {
            countries = localCountries
        }
    }
}
