//
//  DataDecoder.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

protocol DataDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

struct DataDecoderImpl: DataDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw AppError.decodingError
        }
    }
}
