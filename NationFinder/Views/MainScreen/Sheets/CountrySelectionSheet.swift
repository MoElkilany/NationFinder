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
            
            VStack{
                SearchTextFieldView { text in
                    viewModel.searchText = text
                }
                .padding(.horizontal)
                
                List {
                    ForEach(viewModel.countries, id: \.self) { item in
                        HStack {
                            SmallFlagView(url: item.flags?.png ?? "https://flagcdn.com/w320/eg.png")
                            Text(item.name ?? "")
                            Spacer()
                            Image(viewModel.tempSelectedCountries.contains(item) == true ? .checkIcon : .uncheckIcon)
                            
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.toggleCountrySelection(item)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        viewModel.finalizeCountrySelection()
                    }
                }
            }
        }
    }
}
