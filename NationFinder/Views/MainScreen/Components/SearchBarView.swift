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
                Image(.whiteSearchIcon)
                    .padding(.horizontal, 8)
                Text("Search")
                    .foregroundColor(.white)
            }
            .frame(width: 130 , height: 40)
            .borderedBackground( borderColor: .color121441, backgroundColor: .color121441)
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.openSearch.toggle()
            }
        }
        
    }
}


//class SearchBarViewModel: ObservableObject {
//    @Published var openSearch: Bool
//    
//    init(openSearch: Bool) {
//        self.openSearch = openSearch
//    }
//
//}
