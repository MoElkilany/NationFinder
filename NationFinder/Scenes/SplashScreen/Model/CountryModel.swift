//
//  CountryModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import Foundation
import SwiftData

@Model
class CountryModel: Decodable  {

    var name: String?
    var capital: String?
    var currencies: [Currency]?
    var latlng: [Double]?
    var flags: FlagsModel?
    var languages: [LanguagesModel]?

    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case currencies
        case latlng
        case flags
        case languages

    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        capital = try container.decodeIfPresent(String.self, forKey: .capital)
        currencies = try container.decodeIfPresent([Currency].self, forKey: .currencies)
        latlng = try container.decodeIfPresent([Double].self, forKey: .latlng)
        flags = try container.decodeIfPresent(FlagsModel.self, forKey: .flags)
        languages = try container.decodeIfPresent([LanguagesModel].self, forKey: .languages)

    }
    
    
     
}

@Model
class Currency: Decodable {
    var code: String?
    var name: String?
    var symbol: String?

    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
    }
}

@Model
class FlagsModel: Decodable {
    var png: String?

    enum CodingKeys: String, CodingKey {
        case png
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        png = try container.decodeIfPresent(String.self, forKey: .png)
    }
}

@Model
class LanguagesModel: Decodable {
    var name: String?

    enum CodingKeys: String, CodingKey {
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
