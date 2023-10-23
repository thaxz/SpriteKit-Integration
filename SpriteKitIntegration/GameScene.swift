//
//  GameScene.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: Components
    var player = SKSpriteNode()
    
    // MARK: View lifecycle
    
    override func didMove(to view: SKView) {
        setUpScene()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // the location of the touch in the view
            let location = touch.location(in: self)
            // adding this location to the player
            player.position.x = location.x
            player.position.y = location.y
        }
    }
    
    private func setUpScene(){
        setUpBackground()
        setUpPlayer()
    }
    
    private func setUpBackground(){
        let background = SKSpriteNode(color: .black, size: self.size)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = 0
        addChild(background)
    }
    
    private func setUpPlayer(){
        player = SKSpriteNode(color: .systemRed, size: CGSize(width: 0.20, height: 0.1))
        player.zPosition = 2
        player.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(player)
    }
    
    private func setUpNodes(){
        
    }
    
    
    
}
