//
//  SplashViewModel.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 03/02/2025.
//

import Foundation
import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published private(set) var countries: [CountryModel] = []
    @Published private(set) var splashState: SplashState = .loading

    var repository: CountryRepositoryProtocol
     
     init(repository: CountryRepositoryProtocol = CountryRepository()) {
         self.repository = repository
     }
     
    
    @MainActor
       func loadCountryData() {
           Task {
               do {
                   let countyData = try await repository.getCountries()
                   if countyData.isEmpty {
                       splashState = .empty
                   } else {
                       countries = countyData
                       splashState = .loaded
                   }
               } catch let error as AppError {
                splashState = .error("Error: \(error)")
               } catch {
                splashState = .error("Internal Server Error")
               }
           }
       }
}
