//
//  CountryRepository.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

protocol CountryRepositoryProtocol {
    func getCountries() async throws -> [CountryModel]
}

struct CountryRepository: CountryRepositoryProtocol {
    private let apiService: APIServicesProtocol
    
    init(apiService: APIServicesProtocol = APIServices()) {
        self.apiService = apiService
    }
    
    func getCountries() async throws -> [CountryModel] {
        return try await apiService.fetchCountries()
    }
}
