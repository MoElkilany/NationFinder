//
//  AppError.swift
//  PreFinalChallange
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

enum AppError: Error, LocalizedError,Equatable {
    case noData
    case serverError
    case urlError
    case decodingError
    case networkError(String)

    var errorDescription: String? {
        switch self {
        case .noData:
            return AppConstants.AppError.noData
        case .urlError:
            return AppConstants.AppError.urlError
        case .decodingError:
            return AppConstants.AppError.decodingError
        case .serverError:
            return AppConstants.AppError.internalServerError
        case .networkError(let error):
            return AppConstants.AppError.networkError + " " + error
        }
    }
}
