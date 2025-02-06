//
//   CountryDetailsFactory.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 06/02/2025.
//

import Foundation
import SwiftUI


struct CountryDetailsFactory {
    
    static func makeCountryDetails(country:CountryModel) -> some View {
        let view = CountryDetailScreen(selectedCountry: country)
        return view
    }
}
