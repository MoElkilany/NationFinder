//
//  MockCountryService.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder
class MockCountryService: APIServices {
    var countries: [CountryModel]?
    var error: Error?

    func fetchCountries() async throws -> [CountryModel] {
        if let error = error {
            throw error
        }
        return countries!
    }
}




