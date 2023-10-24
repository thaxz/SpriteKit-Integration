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
    
    // MARK: Scene SetUp
    
    func setUpScene(){
        scene?.size = CGSize(width: width, height: height)
        setUpBackground()
        setUpPlayer()
        setUpAlly()
        setUpEnemy()
    }
    
    private func setUpBackground(){
        // Create and position the background node
        let background = SKSpriteNode(color: .black, size: self.size)
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = 0
        addChild(background)
    }
    
    private func setUpPlayer(){
        // Create and position the player node
        playerNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 100, height: 100))
        playerNode.position = CGPoint(x: frame.midX, y: frame.midY)
        playerNode.zPosition = 2
        // Set up physics properties for the player node
        playerNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.physicsBody?.isDynamic = true
        playerNode.physicsBody?.categoryBitMask = CBitmask.player
        
        playerNode.physicsBody?.contactTestBitMask = CBitmask.ally | CBitmask.enemy
        addChild(playerNode)
    }
    
    private func setUpAlly(){
        // Create and position the ally node
        allyNode = SKSpriteNode(color: .systemRed, size: CGSize(width: 100, height: 100))
        allyNode.position = CGPoint(x: frame.midX, y: frame.minY + 50)
        allyNode.zPosition = 2
        // Set up physics properties for the ally node
        allyNode.physicsBody = SKPhysicsBody(rectangleOf: allyNode.size)
        allyNode.physicsBody?.affectedByGravity = false
        allyNode.physicsBody?.isDynamic = false
        allyNode.physicsBody?.categoryBitMask = CBitmask.ally
        allyNode.physicsBody?.contactTestBitMask = CBitmask.player
        addChild(allyNode)
    }
    
    func setUpEnemy(){
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
