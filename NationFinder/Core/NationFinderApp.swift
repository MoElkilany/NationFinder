//
//  NationFinderApp.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import SwiftUI
import SwiftData

@main
struct NationFinderApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen(viewModel: SplashViewModel())
        }
    }
}
