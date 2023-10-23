//
//  ContentView.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var gameScene: GameScene {
        let scene = GameScene()
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: gameScene)
                .ignoresSafeArea()
            VStack {
                Text("Score: ")
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
