//
//  ContentView+Delegate.swift
//  SpriteKitIntegration
//
//  Created by Juliano on 07/11/23.
//

extension ContentView: GameLogicDelegate {
    
    // mutating func addPoint() { What is the differences?
    func addPoint() {

        totalScore += 1
    }
    
   // mutating func removePoint() { What is the differences?
    func removePoint() {
        totalScore -= 1
    }
}
