//
//  SplashState.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation

enum SplashState: Equatable {
    case loading
    case loaded
    case error(String)
    case empty
}

