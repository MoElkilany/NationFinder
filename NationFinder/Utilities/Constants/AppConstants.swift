//
//  AppConstants.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

struct AppConstants {
    struct API {
        static let countriesEndpoint = "https://restcountries.com/v2/all"
    }
    
    struct AppError {
        static let noData = "No data received from the server."
        static let urlError = "Invalid URL."
        static let decodingError = "Failed to decode data."
        static let networkError = "Network error: "
        static let internalServerError = "Internal Server Error"
        static let appError = "Error: "
    }
    
    struct AppText  {
        static let nationFinder = "Nation Finder"
        static let loading = "Loading..."
        static let noData = "There is No Data"
        static let cancel = "Cancel"
        static let done = "Done"
        static let onlyFiveCountries = "There’s No Country Added, You Can Add Only 5 Countries."
        static let searchForCountry = "Search For Country"
        static let search = "Search"
        static let defaultCountry = "Default country :"
        static let additionalCountry = "Default countries :"
        static let addCountry = " + Add Country"
        static let turkey = "Turkey"
        static let currency = "Currency:"
        static let country = "Country:"
        static let capital = "Capital:"
        static let languages = "Languages:"


    }
    
}

