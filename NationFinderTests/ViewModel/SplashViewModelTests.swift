//
//  SplashViewModelTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class SplashViewModelTests: XCTestCase {
    var viewModel: SplashViewModel!
    var mockRepository: MockCountryRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockCountryRepository()
        viewModel = SplashViewModel(repository: mockRepository)
    }
    
    func testLoadCountryDataSuccess()  {
        
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
        let expectation = XCTestExpectation(description: "Load country data")

    
        mockRepository.countries = expectedCountries
    
        
        Task{
            await viewModel.loadCountryData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout:  5.0)
        
     
        XCTAssertEqual(self.viewModel.countries, expectedCountries)
        XCTAssertEqual(self.viewModel.splashState, .loaded)
        
    }
    
    func testLoadCountryDataEmpty()  {
        mockRepository.countries = []
        let expectation = XCTestExpectation(description: "Load country data")

        Task{
            await viewModel.loadCountryData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout:  5.0)
        
        XCTAssertEqual(viewModel.countries, [])
        XCTAssertEqual(viewModel.splashState, .empty)
    }
    

    func testLoadCountryDataFailure()  {

        mockRepository.error = AppError.noData

        let expectation = XCTestExpectation(
            description: "Wait for loadCountryData to complete"
        )

        Task {
            await viewModel.loadCountryData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5.0)

        XCTAssertEqual(
            viewModel.splashState,
            .error("Error: \(AppError.noData)")
        )
    }
    
}
