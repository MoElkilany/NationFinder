//
//  APIServicesTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class APIServicesTests: XCTestCase {
    var apiService: APIServices!
    var mockNetworkManager: MockNetworkManager!
    var mockDataDecoder: MockDataDecoder!
    var mockEndPoint: MockEndPoint!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        mockDataDecoder = MockDataDecoder()
        mockEndPoint = MockEndPoint()
        apiService = APIServices(
            networkManager: mockNetworkManager,
            decoder: mockDataDecoder,
            endPoint: mockEndPoint
        )
    }

    func testFetchCountriesSuccess() async {
      
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
        
        
        let jsonData = try! JSONEncoder().encode(expectedCountries)
        mockNetworkManager.data = jsonData
        mockDataDecoder.decodedData = expectedCountries
        mockEndPoint.url = URL(string: "https://restcountries.com/v2/all")!

        do {
            let countries = try await apiService.fetchCountries()
            XCTAssertEqual(countries, expectedCountries)
        } catch {
            XCTFail("Expected success, but got \(error)")
        }
    }

    func testFetchCountriesFailure() async {
        mockNetworkManager.error = AppError.noData

        do {
            _ = try await apiService.fetchCountries()
            XCTFail("Expected failure, but got success")
        } catch {
            //            XCTAssertEqual(error as? AppError, AppError.noData)
        }
    }
}
