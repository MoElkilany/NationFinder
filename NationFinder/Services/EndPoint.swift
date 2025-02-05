//
//  EndPoint.swift
//  YourCountryApp
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

protocol EndPointProtocol {
    func createURL(urlString: String) throws -> URL
}

struct EndPoint: EndPointProtocol {
    func createURL(urlString: String) throws -> URL {
        guard let url = URL(string: urlString ) else {
            throw AppError.urlError
        }
        return url
    }
}

