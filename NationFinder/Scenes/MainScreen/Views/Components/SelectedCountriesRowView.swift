//
//  OnlyFiveCountryRow.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct SelectedCountriesRowView: View {
    let country: CountryModel
    
    var body: some View {
        HStack(spacing: 12) {
            SmallFlagView(url: country.flags?.png ?? "")
            Text(country.name ?? "")
                .foregroundColor(.color808080)
           
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 65)
        .borderedBackground()
    }
}
