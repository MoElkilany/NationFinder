//
//  MainViewModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import Foundation

class MainViewModel: ObservableObject {
    
    @Published private var currentUserCountry: String = ""
    @Published private var locationManager = LocationManager()
    @Published var allCountries: [CountryModel] = []
    @Published var isCountryDetailVisible = false
    @Published var selectedCountry: CountryModel?
    @Published var isCountrySelectionSheetOpen = false
    @Published var isSearchSelectionSheetOpen = false
    @Published var selectedCountriesList: [CountryModel] = []
    @Published var tempSelectedCountriesList: [CountryModel] = []
    @Published var searchQuery = ""
    private let maxSelectedCountries = 5

    init(countries: [CountryModel]) {
        self.allCountries = countries
        self.currentUserCountry = locationManager.userCountry
        locationManager.$userCountry
            .assign(to: &$currentUserCountry)
    }

    var searchList: [CountryModel] {
        searchQuery.isEmpty ? allCountries :  allCountries
            .filter {
                $0.name?.localizedCaseInsensitiveContains(searchQuery) ?? false
            }
    }
    
    func fetchCurrentUserCountry() -> CountryModel? {
        return allCountries.first(where: { $0.name == currentUserCountry }) ??
        allCountries.first(where: { $0.name == "Turkey" })
    }
    
    func countrySelection(_ country: CountryModel) {
        if tempSelectedCountriesList.contains(country) {
            tempSelectedCountriesList.removeAll { $0 == country }
        } else {
            if tempSelectedCountriesList.count < maxSelectedCountries {
                tempSelectedCountriesList.append(country)
            }
        }
    }
    
    func confirmSelectedCountries() {
        selectedCountriesList = tempSelectedCountriesList
        isCountrySelectionSheetOpen = false
    }
    
    func clearSelectedCountries() {
        selectedCountriesList.removeAll()
        tempSelectedCountriesList.removeAll()
    }
    
    func displayCountryDetail(_ country: CountryModel) {
        searchQuery = ""
        selectedCountry = country
        isCountryDetailVisible = true
        isSearchSelectionSheetOpen = false
    }
    
    func cancelSearchAction() {
        searchQuery = ""
        isSearchSelectionSheetOpen = false
    }
}
