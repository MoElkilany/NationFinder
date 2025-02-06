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
            CountryInfoView(title: AppConstants.AppText.country, value: country.name ?? "" )
            CountryInfoView(title: AppConstants.AppText.capital, value: country.capital ?? "" )
            CurrencyInfoView(currencies: country.currencies)
            CountryInfoView(title: AppConstants.AppText.languages, value: country.languages?.first?.name ?? "-")
        }
        .padding()
        .borderedBackground()
    }
}
//
