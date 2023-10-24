//
//  ContentView.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View, GameLogicDelegate {
    
    @State var totalScore: Int = 0
    
    mutating func addPoint() {
        totalScore += 1
    }
    
    mutating func removePoint() {
        totalScore -= 1
    }
    
    // Initializing the Game Scene
    var gameScene: GameScene {
        let scene = GameScene()
        scene.scaleMode = .fill
        scene.gameLogicDelegate = self
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
