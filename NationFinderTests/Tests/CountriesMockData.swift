//
//  CountriesMockData.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 06/02/2025.
//

import Foundation

enum CountryCases {
    case result
    case empty
}

@testable import NationFinder
struct CountriesMockData {
    
    
    
    static func allCountries() -> [CountryModel] {
         [
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
    }
    
        
    
     func getCountriesData(countryCases:CountryCases) -> [CountryModel] {
        switch countryCases {
        case .result:
            return CountriesMockData.allCountries()
        case .empty:
            return []
        }
      
    }
    
    
}
