//
//  ContentView+Delegate.swift
//  SpriteKitIntegration
//
//  Created by Juliano on 07/11/23.
//

extension ContentView: GameLogicDelegate {
    
    //mutating func addPoint() {
    // Remove mutating desnecessário pois variável totalScore já é State que tem como papel modificar valores antes imutáveis na struct
    func addPoint() {
        totalScore += 1
    }
   // mutating func removePoint() {
    // Remove mutating desnecessário pois variável totalScore já é State que tem como papel modificar valores antes imutáveis na struct
    func removePoint() {
        totalScore -= 1
    }
}
