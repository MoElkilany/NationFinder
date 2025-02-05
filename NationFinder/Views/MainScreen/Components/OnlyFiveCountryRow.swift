//
//  OnlyFiveCountryRow.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct OnlyFiveCountryRow: View {
    let country: CountryModel
    
    var body: some View {
        HStack(spacing: 12) {
            SmallFlagView(url: country.flags?.png ?? "https://flagcdn.com/w320/eg.png")
            Text(country.capital ?? "")
                .foregroundColor(.color808080)
            Text(country.currencies?.first?.name ?? "")
                .foregroundColor(.color808080)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 65)
        .borderedBackground()
    }
}
