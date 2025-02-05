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
    private let endPoint: EndPointProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(),
          decoder: DataDecoderProtocol = DataDecoder(),
          endPoint: EndPointProtocol = EndPoint()) {
         self.networkManager = networkManager
         self.decoder = decoder
         self.endPoint = endPoint
     }
    
    func fetchCountries() async throws -> [CountryModel] {
        let url = try endPoint.createURL(urlString: AppConstants.API.countriesEndpoint)
        let data = try await networkManager.fetchData(from: url)
        return try decoder.decode(data)
    }

}
