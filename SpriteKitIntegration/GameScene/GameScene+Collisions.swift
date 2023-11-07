//
//  GameScene+Collisions.swift
//  SpriteKitIntegration
//
//  Created by thaxz on 24/10/23.
//

import SpriteKit

// MARK: - Collisions

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        let contactA: SKPhysicsBody
        let contactB: SKPhysicsBody
        
        // Ensure contactA always has a smaller categoryBitMask
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA
        }
        
        // Handle collision between player and ally
        if contactA.categoryBitMask == CBitmask.player && contactB.categoryBitMask == CBitmask.ally {
            addPoint()
        }
        // Handle collision between player and enemy
        if contactA.categoryBitMask == CBitmask.player && contactB.categoryBitMask == CBitmask.enemy {
            removePoint()
        }
    }
}
