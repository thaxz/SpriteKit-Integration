//
//  ContentView+Delegate.swift
//  SpriteKitIntegration
//
//  Created by Juliano on 07/11/23.
//

extension ContentView: GameLogicDelegate {
    
    mutating func addPoint() {
        totalScore += 1
    }
    
    mutating func removePoint() {
        totalScore -= 1
    }
}
