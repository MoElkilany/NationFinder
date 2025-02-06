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
    var mockCountries: [CountryModel]!

    override func setUp() {
        super.setUp()
        mockCountries = [
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
            ),
           
            CountryModel(
                name: "Saudia Arabia",
                capital: "Riyadh",
                currencies: [Currency(
                    code: "Sar",
                    name: "Ryal",
                    symbol: "Sar"
                )],
                latlng: [32.322333, 31.235556],
                flags: FlagsModel(png: ""),
                languages: [LanguagesModel(name: "Arabic")]
            ),
            
            
        ]
        viewModel = MainViewModel(countries: mockCountries)
    }

    override func tearDown() {
        mockCountries = nil
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertEqual(viewModel.countries, mockCountries)
        XCTAssertTrue(viewModel.selectedFiveCountries.isEmpty)
        XCTAssertTrue(viewModel.tempSelectedCountries.isEmpty)
        XCTAssertFalse(viewModel.openSheet)
        XCTAssertFalse(viewModel.openSearch)
        XCTAssertFalse(viewModel.isShowingCountryDetail)
        XCTAssertNil(viewModel.selectedCountry)
    }

    func testSearchList() {
        viewModel.searchText = ""
        XCTAssertEqual(viewModel.searchList, mockCountries)

        viewModel.searchText = "Ankara"
        XCTAssertEqual(viewModel.searchList, [mockCountries[0]])

        viewModel.searchText = "London"
        XCTAssertTrue(viewModel.searchList.isEmpty)
    }

    func testToggleCountrySelection() {
        let turkey = mockCountries[0]
        let egypt = mockCountries[1]

        viewModel.toggleCountrySelection(turkey)
        XCTAssertTrue(viewModel.tempSelectedCountries.contains(turkey))

        viewModel.toggleCountrySelection(turkey)
        XCTAssertFalse(viewModel.tempSelectedCountries.contains(turkey))

        for country in mockCountries {
            viewModel.toggleCountrySelection(country)
        }
        XCTAssertEqual(viewModel.tempSelectedCountries.count, 3)
    }

    func testFinalizeCountrySelection() {
        let turkey = mockCountries[0]
        let egypt = mockCountries[1]

        viewModel.toggleCountrySelection(turkey)
        viewModel.toggleCountrySelection(egypt)

        viewModel.finalizeCountrySelection()
        XCTAssertEqual(viewModel.selectedFiveCountries, [turkey, egypt])
        XCTAssertFalse(viewModel.openSheet)
    }

    func testGetCurrentUserCountry() {
        viewModel.currentCountry = "Turkey"
        XCTAssertEqual(viewModel.getCurrentUserCountry()?.name, "Turkey")

        viewModel.currentCountry = "Unknown"
        XCTAssertEqual(viewModel.getCurrentUserCountry()?.name, "Turkey")

        viewModel.currentCountry = ""
        XCTAssertEqual(viewModel.getCurrentUserCountry()?.name, "Turkey")
    }

    func testSheetAndNavigationStates() {
        let turkey = mockCountries[0]

        viewModel.openSheet = true
        XCTAssertTrue(viewModel.openSheet)

        viewModel.openSearch = true
        XCTAssertTrue(viewModel.openSearch)

        viewModel.selectCountry(turkey)
        XCTAssertEqual(viewModel.selectedCountry, turkey)
        XCTAssertTrue(viewModel.isShowingCountryDetail)
        XCTAssertFalse(viewModel.openSearch)

        viewModel.cancelSearch()
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertFalse(viewModel.openSearch)
    }

    func testClearSelectedCountries() {
        let turkey = mockCountries[0]
        let egypt = mockCountries[1]

        viewModel.toggleCountrySelection(turkey)
        viewModel.toggleCountrySelection(egypt)
        viewModel.finalizeCountrySelection()

        viewModel.clearSelectedCountries()
        XCTAssertTrue(viewModel.selectedFiveCountries.isEmpty)
        XCTAssertTrue(viewModel.tempSelectedCountries.isEmpty)
    }
}


/*
 var mockCountries: CountriesMockData!

 override func setUp() {
     super.setUp()
     mockCountries = CountriesMockData()
 }

 override func tearDown() {
     mockCountries = nil
     super.tearDown()
 }

 func testInitialization() {
     // Given
     let countries = mockCountries.getCountriesData(countryCases: .empty)
     let viewModel = MainViewModel(countries: countries )
     
     XCTAssertEqual(viewModel.countries, countries )
     XCTAssertTrue(viewModel.selectedFiveCountries.isEmpty)
     XCTAssertTrue(viewModel.tempSelectedCountries.isEmpty)
     XCTAssertFalse(viewModel.openSheet)
     XCTAssertFalse(viewModel.openSearch)
     XCTAssertFalse(viewModel.isShowingCountryDetail)
//        XCTAssertNil(viewModel.selectedCountry)
 }
 */
