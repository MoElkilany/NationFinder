//
//  MockCountryRepository.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder
class MockCountryRepository: CountryRepository {
    var countries: [CountryModel]?
    var error: Error?

    func getCountries() async throws -> [CountryModel] {
        if let error = error {
            print("Mock repository throwing error: \(error)") 
            throw error
        }
        guard let countries = countries else {
            return []
        }
        return countries
    }
}
