//
//  DefaultCountryView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct DefaultCountryView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            TitleRowView(title: "Default country :")
            HStack(spacing: 12) {
                SmallFlagView(url: viewModel.fetchCurrentUserCountry()?.flags?.png ?? "https://flagcdn.com/w320/eg.png")
                VStack(alignment: .leading) {
                    Text(viewModel.fetchCurrentUserCountry()?.name ?? "")
                        .foregroundColor(.color0B0C26)
                    Text(viewModel.fetchCurrentUserCountry()?.capital ?? "")
                        .foregroundColor(.color808080)
                }
                Spacer()
                VStack(alignment: .center) {
                    Text(viewModel.fetchCurrentUserCountry()?.currencies?.first?.name ?? "")
                        .foregroundColor(.color808080)
                    Text(viewModel.fetchCurrentUserCountry()?.currencies?.first?.symbol ?? "")
                        .fontWeight(.bold)
                        .foregroundColor(.color808080)
                }
            }
            .padding()
            .frame(height: 65)
            .borderedBackground()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.selectedCountry = viewModel.fetchCurrentUserCountry()
            viewModel.isCountryDetailVisible = true
        }
    }
}
