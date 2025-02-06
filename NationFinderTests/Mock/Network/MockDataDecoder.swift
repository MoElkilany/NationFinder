//
//  MockDataDecoder.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//


import XCTest
@testable import NationFinder
class MockDataDecoder: DataDecoder {
    var decodedData: Any?
    var error: Error?

    func decode<T: Decodable>(_ data: Data) throws -> T {
        if let error = error {
            throw error
        }
        return decodedData as! T
    }
}
