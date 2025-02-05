//
//  MockEndPoint.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder
class MockEndPoint: EndPointProtocol {
    var url: URL?
    var error: Error?

    func createURL(urlString: String) throws -> URL {
        if let error = error {
            throw error
        }
        guard let url = url else {
            throw AppError.urlError 
        }
        return url
    }
}
