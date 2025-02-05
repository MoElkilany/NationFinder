//
//  CountrySelectionSheet.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import SwiftUI
struct CountrySelectionSheet: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.countries, id: \.self) { item in
                    HStack {
                        SmallFlagView(url: item.flags?.png ?? "https://flagcdn.com/w320/eg.png")
                        Text(item.capital ?? "")
                        Text(item.currencies?.first?.symbol ?? "")
                        Spacer()
                        Image(viewModel.tempSelectedCountries.contains(item) == true ? .checkIcon : .uncheckIcon)
                        
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.toggleCountrySelection(item)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        viewModel.finalizeCountrySelection()
                    }
                }
            }
        }
    }
}
