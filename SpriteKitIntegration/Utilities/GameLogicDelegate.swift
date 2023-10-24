//
//  GameLogicDelegate.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 24/10/23.
//

import Foundation

protocol GameLogicDelegate {
    
    var totalScore: Int { get }
    mutating func addPoint() -> Void
    mutating func removePoint() -> Void
}
