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
                    viewModel.searchQuery = text
                }
                .padding(.horizontal)
                
                List {
      
                    ForEach(viewModel.searchList, id: \.self) { item in
                        HStack {
                            SmallFlagView(
                                url: item.flags?.png ?? "https://flagcdn.com/w320/eg.png"
                            )
                            Text(item.name ?? "")
                            Spacer()
                            Image(
                                viewModel.tempSelectedCountriesList
                                    .contains(
                                        item
                                    ) == true ? .checkIcon : .uncheckIcon
                            )
                                
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.countrySelection(item)
                        }
                    }
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(AppConstants.AppText.done) {
                        viewModel.confirmSelectedCountries()
                        viewModel.cancelSearchAction()
                    }
                }
            }
        }
    }
}
