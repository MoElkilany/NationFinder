//
//  MockNetworkManager.swift
//  NationFinderTests
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import XCTest
@testable import NationFinder

class MockNetworkManager: NetworkManagerProtocol {
    var data: Data?
    var error: Error?

    func fetchData(from url: URL) async throws -> Data {
        if let error = error {
            throw error
        }
        return data!
    }
}









