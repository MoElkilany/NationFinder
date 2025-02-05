//
//  SearchBarView.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//



import SwiftUI
struct SearchBarView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            Image(.searchIcon)
                .padding(.horizontal, 8)
            Text("Search For Country")
                .foregroundColor(.gray)
            Spacer()
        }
        .frame(height: 50)
        .borderedBackground()
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.openSearch.toggle()
        }
    }
}
