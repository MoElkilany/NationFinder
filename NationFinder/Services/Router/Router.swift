//
//  Router.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

protocol Router {
    var baseURL: URL? { get }
    var methodType: HTTPMethod { get }
    func createURL() throws -> URL
}

struct CountriesRouterImpl: Router {

    var baseURL: URL? = URL(
        string: AppConstants.API.countriesEndpoint
    )
    var methodType: HTTPMethod = .get
    
    func createURL() throws -> URL {
        guard let url = baseURL else {
            throw AppError.urlError
        }
        return url
    }
}



