//
//  CountryInfoSection.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//



import SwiftUI
struct CountryInfoSection: View {
    let country: CountryModel

    var body: some View {
        VStack {
            CountryInfoView(title: "Country:", value: country.name ?? "" )
            CountryInfoView(title: "Capital:", value: country.capital ?? "" )
            CurrencyInfoView(currencies: country.currencies)
            CountryInfoView(title: "Languages:", value: country.languages?.first?.name ?? "-")
        }
        .padding()
        .borderedBackground()
    }
}
