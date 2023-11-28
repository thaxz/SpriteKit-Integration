//
//  GameLogicDelegate.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 24/10/23.
//

// Protocol defining the methods and properties required for game logic.
protocol GameLogicDelegate {
    
    // Property to get the total score.
    var totalScore: Int { get }
    
    // Function to add a point to the score.
//    mutating func addPoint() -> Void
     func addPoint() -> Void
    
    // Function to remove a point from the score.
     func removePoint() -> Void
//    mutating func removePoint() -> Void
}
