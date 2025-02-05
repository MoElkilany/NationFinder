//
//  AppError.swift
//  PreFinalChallange
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

enum AppError: Error, LocalizedError,Equatable {
    case noData
    case urlError
    case decodingError
    case networkError(String)

    var errorDescription: String? {
        switch self {
        case .noData:
            return "No data received from the server."
        case .urlError:
            return "Invalid URL."
        case .decodingError:
            return "Failed to decode data."
        case .networkError(let error):
            return "Network error: \(error)"
        }
    }
}
