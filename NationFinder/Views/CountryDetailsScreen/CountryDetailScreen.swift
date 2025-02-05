//
//  CountryDetailScreen.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//
import SwiftUI

struct CountryDetailScreen: View {
    
    var selectedCountry: CountryModel?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(.colorF5F5F5)
                .ignoresSafeArea()
            
            VStack {
                if let country = selectedCountry {
                    CountryFlagView(flagURL: country.flags?.png)
                    
                    Spacer().frame(height: 50)
                    
                    CountryInfoSection(country: country)
                    
                    Spacer()
                }
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack {
                        Image(.dismissIcon)
                        Spacer()
                    }

                }
            }
        }
    }
}

#Preview {
    CountryDetailScreen(selectedCountry: nil)
}





