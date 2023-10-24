//
//  GameScene.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import Foundation
import SpriteKit

let height = UIScreen.main.bounds.height
let width = UIScreen.main.bounds.width

class GameScene: SKScene {
    
    // MARK: Components
    var playerNode = SKSpriteNode()
    var enemyNode = SKSpriteNode()
    var allyNode = SKSpriteNode()
    
    
    // MARK: View lifecycle
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
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
    
    // MARK: Scene SetUp
    
    private func setUpScene(){
        scene?.size = CGSize(width: width, height: height)
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
        playerNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 100, height: 100))
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
        playerNode.zPosition = 2
        playerNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.physicsBody?.isDynamic = true
        playerNode.physicsBody?.categoryBitMask = CBitmask.player
        
        playerNode.physicsBody?.contactTestBitMask = CBitmask.ally | CBitmask.enemy
        addChild(playerNode)
    }
    
    private func setUpNodes(){
        allyNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 100, height: 100))
        allyNode.position = CGPoint(x: frame.midX, y: frame.minY + 50)
        allyNode.zPosition = 2
        allyNode.physicsBody = SKPhysicsBody(rectangleOf: allyNode.size)
        allyNode.physicsBody?.affectedByGravity = false
        allyNode.physicsBody?.isDynamic = false
        allyNode.physicsBody?.categoryBitMask = CBitmask.ally
        allyNode.physicsBody?.contactTestBitMask = CBitmask.player
        addChild(allyNode)
        enemyNode = SKSpriteNode(color: .systemBlue, size: CGSize(width: 100, height: 100))
        enemyNode.zPosition = 2
        enemyNode.position = CGPoint(x: frame.minX + 50, y: frame.midY)
        enemyNode.physicsBody = SKPhysicsBody(rectangleOf: enemyNode.size)
        enemyNode.physicsBody?.affectedByGravity = false
        enemyNode.physicsBody?.isDynamic = false
        enemyNode.physicsBody?.categoryBitMask = CBitmask.enemy
        enemyNode.physicsBody?.contactTestBitMask = CBitmask.player
        addChild(enemyNode)
    }
    
}

// MARK: Collisions

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        // Pro menor sempre ser o contactA
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA
        }
        
        // Player and ally
        if contactA.categoryBitMask == CBitmask.player && contactB.categoryBitMask == CBitmask.ally {
           print("tocou")
        }
        // Player and ally
        if contactA.categoryBitMask == CBitmask.player && contactB.categoryBitMask == CBitmask.enemy {
           print("tocou no enemy")
        }
        
    }
    
}
