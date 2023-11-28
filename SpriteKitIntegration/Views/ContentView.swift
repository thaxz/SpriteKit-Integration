//
//  ContentView.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import SpriteKit
import SwiftUI

struct ContentView: View {
    //MARK: - View
    
    @State var totalScore: Int = 0
    //poderia ser somente: @State var totalScore: Int = 0?
    
    // Initialize the Game Scene and integrate the delegate with gameScene connecting it by a SwiftUI view
    var gameScene: GameScene {
        let scene = GameScene(gameLogicDelegate: self)
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene)
                .ignoresSafeArea()
            VStack {
                Text("Score: \(totalScore)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
        }
    }
}

