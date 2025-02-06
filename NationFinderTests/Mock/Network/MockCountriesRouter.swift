//
//  MockEndPoint.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder

class MockCountriesRouter: Router {
    var baseURL: URL?
    var error: Error?
    var methodType: NationFinder.HTTPMethod = .get
    

    func createURL() throws -> URL {
        if let error = error {
            throw error
        }
        
        guard let url = baseURL else {
            throw AppError.urlError
        }
        return url
    }
}
