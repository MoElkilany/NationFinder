//
//  CurrencyInfoView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//



import SwiftUI
struct CurrencyInfoView: View {
    let currencies: [Currency]?
    
    var body: some View {
        VStack(spacing: 0) {
            TitleRowView(title: AppConstants.AppText.currency)
            
            HStack {
                Text(currencies?.first?.name ?? "-")
                    .foregroundColor(.color808080)
                Spacer()
                Text(currencies?.first?.symbol ?? "-")
                    .fontWeight(.bold)
                    .foregroundColor(.color808080)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .borderedBackground(backgroundColor: .colorF5F5F5)
        }
    }
}
