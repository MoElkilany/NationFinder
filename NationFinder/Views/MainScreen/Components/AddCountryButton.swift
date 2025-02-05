//
//  AddCountryButton.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct AddCountryButton: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        Button {
            viewModel.openSheet.toggle()
        } label: {
            HStack {
                Text(" + Add Country")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(.color121441))
        }
    }
}
