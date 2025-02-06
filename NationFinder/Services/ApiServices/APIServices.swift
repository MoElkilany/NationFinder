//
//  APIServices.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import Foundation

protocol APIServices {
    func fetchCountries() async throws -> [CountryModel]
}

class APIServicesImpl: APIServices {
    private let networkManager: NetworkManager
    private let decoder: DataDecoder
    private let router: Router
    
    init(networkManager: NetworkManager,
          decoder: DataDecoder,
         router: Router) {
         self.networkManager = networkManager
         self.decoder = decoder
         self.router = router
     }
    
    func fetchCountries() async throws -> [CountryModel] {
        let url = try router.createURL()
        let data = try await networkManager.fetchData(from: url)
        return try decoder.decode(data)
    }

}
