//
//  GameScene.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 23/10/23.
//

import SpriteKit

class GameScene: SKScene {
    
    // MARK: - Delegate
    var gameLogicDelegate: GameLogicDelegate
    
    // MARK: - Components
    var playerNode: SKSpriteNode
    var enemyNode: SKSpriteNode
    var allyNode: SKSpriteNode
    
    // MARK: - Initializer
    init(gameLogicDelegate: GameLogicDelegate,
         playerNode: SKSpriteNode = SKSpriteNode(),
         enemyNode: SKSpriteNode = SKSpriteNode(),
         allyNode: SKSpriteNode = SKSpriteNode(),
         scaleMode: SKSceneScaleMode = .fill,
         background: SKColor = .black,
         size: CGSize = CGSize(width: GameScene.width, height: GameScene.height)) {
        //our properties fisrt
            self.gameLogicDelegate = gameLogicDelegate
            self.playerNode = playerNode
            self.enemyNode = enemyNode
            self.allyNode = allyNode
        //super init second
            super.init(size: size)
        // gameScene properties third
            self.scaleMode = scaleMode
            self.backgroundColor = background
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Ops, bad inicialization :(")
    }
    
    // MARK: - Scene SetUp
    
    func setUpScene(){
        setUpPlayer()
        setUpAlly()
        setUpEnemy()
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
