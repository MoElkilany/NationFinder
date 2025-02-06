//
//  NetworkManager.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData(from url: URL) async throws -> Data
}

class NetworkManager: NetworkManagerProtocol {
    func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw AppError.noData
        }
        return data
    }
}
