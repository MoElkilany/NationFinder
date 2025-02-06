//
//  APIServices.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 04/02/2025.
//


import Foundation

protocol APIServicesProtocol {
    func fetchCountries() async throws -> [CountryModel]
}

class APIServices: APIServicesProtocol {
    private let networkManager: NetworkManagerProtocol
    private let decoder: DataDecoderProtocol
    private let router: Router
    
    init(networkManager: NetworkManagerProtocol,
          decoder: DataDecoderProtocol,
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
