//
//  SearchSheet.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//

import SwiftUI
struct SearchSheet: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchTextFieldView { text in
                    viewModel.searchText = text
                }
                List {
                    ForEach(viewModel.searchList, id: \.self) { item in
                        HStack {
                            SmallFlagView(url: item.flags?.png ?? "https://flagcdn.com/w320/eg.png")
                            Text(item.name ?? "")
                        
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectCountry(item)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            viewModel.cancelSearch()
                        }
                    }
                }
            }
            .padding()
        }
    }
}
