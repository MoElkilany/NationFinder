//
//  MainViewModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import Foundation

class MainViewModel: ObservableObject {
    
    @Published var currentCountry: String = ""
    @Published var countries: [CountryModel] = []
    @Published var isShowingCountryDetail = false
    @Published var selectedCountry: CountryModel?
    @Published var openSheet = false
    @Published var openSearch = false
    @Published var selectedFiveCountries: [CountryModel] = []
    @Published var tempSelectedCountries: [CountryModel] = []
    @Published var searchText = ""
    
    
    
    init(countries: [CountryModel]) {
            self.countries = countries
        }
    
    
    var searchList: [CountryModel] {
        searchText.isEmpty  ?  countries :  countries.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
    }
    
    
    var searchTempList: [CountryModel] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
    
  
    
    func getCurrentUserCountry() -> CountryModel? {
        return countries.first(where: { $0.name == currentCountry }) ??
               countries.first(where: { $0.name == "Turkey" })
    }
    
    func toggleCountrySelection(_ country: CountryModel) {
        if tempSelectedCountries.contains(country) {
            tempSelectedCountries.removeAll { $0 == country }
        } else {
            if tempSelectedCountries.count < 5 {
                tempSelectedCountries.append(country)
            }
        }
    }
    
    func finalizeCountrySelection() {
        selectedFiveCountries = tempSelectedCountries
        openSheet = false
    }
    
    func clearSelectedCountries() {
        selectedFiveCountries.removeAll()
        tempSelectedCountries.removeAll()
    }
    
    func selectCountry(_ country: CountryModel) {
        searchText = ""
        selectedCountry = country
        isShowingCountryDetail = true
        openSearch = false
    }
    
    func cancelSearch() {
        searchText = ""
        openSearch = false
    }
}
