//
//  CountryRepository.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

protocol CountryRepository {
    func getCountries() async throws -> [CountryModel]
}

struct CountryRepositoryImpl: CountryRepository {
    
    private let apiService: APIServices

    init(apiService: APIServices) {
        self.apiService = apiService
   }

    func getCountries() async throws -> [CountryModel] {
        return try await apiService.fetchCountries()
    }

}
