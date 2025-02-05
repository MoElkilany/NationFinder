//
//  CountryModel.swift
//  YourCountryApp
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import Foundation

struct CountryModel: Codable,Hashable{
    let name, capital: String?
    let currencies: [Currency]?
    let latlng: [Double]?
    let flags: FlagsModel?
    let languages: [LanguagesModel]?
}

struct Currency: Codable,Hashable {
    let code, name, symbol: String?
}

struct FlagsModel: Codable,Hashable {
    let png: String?
}

struct LanguagesModel: Codable,Hashable {
    let name: String?
}
