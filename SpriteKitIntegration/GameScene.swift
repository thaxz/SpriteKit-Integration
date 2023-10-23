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
    var playerNode = SKSpriteNode()
    var enemyNode = SKSpriteNode()
    var allyNode = SKSpriteNode()
    
    
    // MARK: View lifecycle
    
    override func didMove(to view: SKView) {
        setUpScene()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // the location of the touch in the view
            let location = touch.location(in: self)
            // adding this location to the player
            playerNode.position.x = location.x
            playerNode.position.y = location.y
        }
    }
    
    private func setUpScene(){
        setUpBackground()
        setUpPlayer()
        setUpNodes()
    }
    
    private func setUpBackground(){
        let background = SKSpriteNode(color: .black, size: self.size)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = 0
        addChild(background)
    }
    
    private func setUpPlayer(){
        playerNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 0.20, height: 0.1))
        playerNode.zPosition = 2
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playerNode)
    }
    
    private func setUpNodes(){
        allyNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 0.10, height: 0.05))
        allyNode.zPosition = 2
        allyNode.position = CGPoint(x: frame.midX, y: frame.minY + 0.1)
        addChild(allyNode)
        enemyNode = SKSpriteNode(color: .systemBlue, size: CGSize(width: 0.10, height: 0.05))
        enemyNode.zPosition = 2
        enemyNode.position = CGPoint(x: frame.minX + 0.1, y: frame.midY)
        addChild(enemyNode)
    }
    
    
    
}
