//
//  Item.swift
//  NationFinder
//
//  Created by Mohamed Elkilany on 05/02/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
