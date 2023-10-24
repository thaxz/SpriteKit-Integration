//
//  GameScene+Touches.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 24/10/23.
//

import Foundation
import SpriteKit

//MARK: Game Logic

extension GameScene {
    
    // When the view is presented
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        setUpScene()
    }
    
    // Handle touch movements
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Get the location of the touch in the scene
            let location = touch.location(in: self)
            // Update the player's position based on the touch location
            playerNode.position.x = location.x
            playerNode.position.y = location.y
        }
    }
    
    // Delegate function
    func addPoint() {
        if var gameLogicDelegate = self.gameLogicDelegate {
            gameLogicDelegate.addPoint()
        }
    }
    
}
