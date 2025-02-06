//
//  APIServicesTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class APIServicesTests: XCTestCase {
    var apiService: APIServicesImpl!
    var mockNetworkManager: MockNetworkManager!
    var mockDataDecoder: MockDataDecoder!
    var mockCountriesRouter: MockCountriesRouter!
    var countriesMockData: CountriesMockData!


    override func setUp() {
        super.setUp()
        countriesMockData = CountriesMockData()
        mockNetworkManager = MockNetworkManager()
        mockDataDecoder = MockDataDecoder()
        mockCountriesRouter = MockCountriesRouter()
        apiService = APIServicesImpl(
            networkManager: mockNetworkManager,
            decoder: mockDataDecoder,
            router: mockCountriesRouter
        )
    }

    func testFetchCountriesSuccess() async {
      
        let expectedCountries = CountriesMockData.allCountries()
        
        let jsonData = try! JSONEncoder().encode(expectedCountries)
        mockNetworkManager.data = jsonData
        mockDataDecoder.decodedData = expectedCountries
        mockCountriesRouter.baseURL = URL(string: "https://restcountries.com/v2/all")!


        do {
            let countries = try await apiService.fetchCountries()
            XCTAssertEqual(countries, expectedCountries)
        } catch {
            XCTFail("Expected success, but got \(error)")
        }
    }

    func testFetchCountriesFailure() async {
        mockNetworkManager.error = AppError.urlError

        do {
            _ = try await apiService.fetchCountries()
            XCTFail("Expected failure, but got success")
        } catch {
            XCTAssertEqual(error as? AppError, AppError.urlError)
        }
    }
}
