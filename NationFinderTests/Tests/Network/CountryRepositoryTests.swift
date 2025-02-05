//
//  CountryRepositoryTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class CountryRepositoryTests: XCTestCase {
    var repository: CountryRepository!
    var mockCountryService: MockCountryService!

    override func setUp() {
        super.setUp()
        mockCountryService = MockCountryService()
        repository = CountryRepository(apiService: mockCountryService)
    }

    func testGetCountriesSuccess() async {
      
        let expectedCountries = [
            CountryModel(
                name: "Turkey",
                capital: "Ankara",
                currencies: [Currency(
                    code: "TRY",
                    name: "Turkish Lira",
                    symbol: "₺"
                )],
                latlng: [39.9334, 32.8597],
                flags: FlagsModel(png: "https://flagcdn.com/tr.png"),
                languages: [LanguagesModel(name: "Turkish")]
            ),
            CountryModel(
                name: "Egypt",
                capital: "Cairo",
                currencies: [Currency(
                    code: "EGP",
                    name: "Pound",
                    symbol: "LE"
                )],
                latlng: [32.322333, 31.235556],
                flags: FlagsModel(png: ""),
                languages: [LanguagesModel(name: "Arabic")]
            )
                  
        ]
        
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
