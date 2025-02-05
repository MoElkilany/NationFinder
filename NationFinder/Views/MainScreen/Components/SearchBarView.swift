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
            Text("Nation Finder")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.color121441)
            Spacer()
            HStack {
                Image(.searchIcon)
                    .padding(.horizontal, 8)
        
            }
            .frame(width: 100 , height: 50)
            .borderedBackground()
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.openSearch.toggle()
            }
        }
        
    }
}
