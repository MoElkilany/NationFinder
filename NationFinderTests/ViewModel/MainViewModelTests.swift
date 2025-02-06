//
//  MainViewModelTests.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder

class MainViewModelTests: XCTestCase {
    
    var viewModel: MainViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = MainViewModel(countries: CountriesMockData.getCountriesData(countryCases: .result))
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testSearchListFiltering() {
        viewModel.searchQuery = "Egy"
        XCTAssertEqual(viewModel.searchList.count, 1)
        XCTAssertEqual(viewModel.searchList.first?.name, "Egypt")
        
        
        viewModel.searchQuery = "Tu"
        XCTAssertEqual(viewModel.searchList.count, 1)
        XCTAssertNotEqual(viewModel.searchList.first?.name, "Egypt")
    }
    
    func testFetchCurrentUserCountry() {
        viewModel.currentUserCountry = "Turkey"
        let country = viewModel.fetchCurrentUserCountry()
        XCTAssertNotNil(country)
        XCTAssertEqual(country?.name, "Turkey")
    }
    
    func testCountrySelection() {
        let country = CountriesMockData.getCountriesData(countryCases: .result)[0]
        viewModel.countrySelection(country)
        XCTAssertTrue(viewModel.tempSelectedCountriesList.contains(country))
        viewModel.countrySelection(country)
        XCTAssertFalse(viewModel.tempSelectedCountriesList.contains(country))
    }
    
    func testConfirmSelectedCountries() {
        let country = CountriesMockData.getCountriesData(countryCases: .result)[0]
        viewModel.countrySelection(country)
        viewModel.confirmSelectedCountries()
        XCTAssertEqual(viewModel.selectedCountriesList.count, 1)
        XCTAssertEqual(viewModel.selectedCountriesList.first?.name, "Turkey")
    }
    
    func testClearSelectedCountries() {
        let country = CountriesMockData.getCountriesData(countryCases: .result)[0]
        viewModel.countrySelection(country)
        viewModel.confirmSelectedCountries()
        viewModel.clearSelectedCountries()
        XCTAssertTrue(viewModel.selectedCountriesList.isEmpty)
        XCTAssertTrue(viewModel.tempSelectedCountriesList.isEmpty)
    }
    
    func testDisplayCountryDetail() {
        let country = CountriesMockData.getCountriesData(countryCases: .result)[1]
        viewModel.displayCountryDetail(country)
        XCTAssertEqual(viewModel.selectedCountry?.name, "Egypt")
        XCTAssertTrue(viewModel.isCountryDetailVisible)
        XCTAssertFalse(viewModel.isSearchSelectionSheetOpen)
    }
    
    func testCancelSearchAction() {
        viewModel.searchQuery = "Test"
        viewModel.isSearchSelectionSheetOpen = true
        viewModel.cancelSearchAction()
        XCTAssertEqual(viewModel.searchQuery, "")
        XCTAssertFalse(viewModel.isSearchSelectionSheetOpen)
    }
}
