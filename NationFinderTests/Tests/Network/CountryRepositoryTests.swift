//
//  CountryRepositoryTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class CountryRepositoryTests: XCTestCase {
    var repository: CountryRepositoryImpl!
    var mockCountryService: MockCountryService!
    var countriesMockData: CountriesMockData!

    override func setUp() {
        super.setUp()
        countriesMockData = CountriesMockData()
        mockCountryService = MockCountryService()
        repository = CountryRepositoryImpl(apiService: mockCountryService)
    }

    func testGetCountriesSuccess() async {
      
        let expectedCountries = CountriesMockData.allCountries()
        
        mockCountryService.countries = expectedCountries

        do {
            let countries = try await repository.getCountries()
            XCTAssertEqual(countries, expectedCountries)
        } catch {
            XCTFail("Expected success, but got \(error)")
        }
    }

    func testGetCountriesFailure() async {
        mockCountryService.error = AppError.decodingError
        do {
            _ = try await repository.getCountries()
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(error as? AppError, AppError.decodingError)
        }
    }
}
