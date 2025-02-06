//
//  SplashViewModelTests.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class SplashViewModelTests: XCTestCase {

    var mockRepository: MockCountryRepository!
    var viewModel: SplashViewModel!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockCountryRepository()
        viewModel = SplashViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        mockRepository = nil
        viewModel = nil
    }
    
    func testFetchCountries_Success()  {
        // Given
        mockRepository.countries = CountriesMockData.allCountries()
        
        // Action
        let expectation = XCTestExpectation(description: "Load country data")
        Task{
            await viewModel.fetchCountries()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout:  5.0)
        // Assert
        XCTAssertEqual(viewModel.splashState, .loaded, "Expected state to be .loaded")
        XCTAssertFalse(viewModel.countries.isEmpty, "Countries list should not be empty")
    }
    
    
    
    func testFetchCountries_Empty()  {
        // Given
        let mockRepository = MockCountryRepository()
        mockRepository.countries = [] // Simulating empty data
        let viewModel = SplashViewModel(repository: mockRepository)
        
        // Action
        let expectation = XCTestExpectation(description: "Expected state to be .empty")
        Task{
            await viewModel.fetchCountries()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout:  5.0)
        
        // Assert
        XCTAssertEqual(viewModel.splashState, .empty, "Expected state to be .empty")
        XCTAssertTrue(viewModel.countries.isEmpty, "Countries list should be empty")
    }
    
    func testFetchCountries_Failure()  {
        // Given
        let mockRepository = MockCountryRepository()
        mockRepository.error = AppError.serverError
        let viewModel = SplashViewModel(repository: mockRepository)
        
        // Action
        let expectation = XCTestExpectation(description: "Expected an error message")
        Task{
            await viewModel.fetchCountries()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout:  5.0)
        
        // Assert
        if case .error(let message) = viewModel.splashState {
            XCTAssertTrue(message.contains("Error"), "Expected an error message")
        } else {
            XCTFail("Expected splashState to be .error")
        }
    }
    
    
}
