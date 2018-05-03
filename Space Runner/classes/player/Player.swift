//
//  Player.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit



class Player: SKSpriteNode{
    private var playerAnimation = [SKTexture]()
    private var playerAnimationAction = SKAction()
    
    func initializePlayer(){
        self.name = "PLAYER"
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = ColliderType.PLAYER
        self.physicsBody?.collisionBitMask = ColliderType.GROUND
        self.physicsBody?.contactTestBitMask = ColliderType.ROCKETandCOLLECTABLES
        self.physicsBody?.affectedByGravity = true
        //self.physicsBody?.isDynamic = false

        
        for index in 1...Utlities.NumberOfTexturesPerPlayer{
            let textureImageName = "player \(index)"
            playerAnimation.append(SKTexture(imageNamed: textureImageName))
        }
        
        playerAnimationAction = SKAction.animate(with: playerAnimation, timePerFrame: Utlities.TimeIntervalPerFrame, resize: true, restore: false)
        
        self.run(SKAction.repeatForever(playerAnimationAction))
        

    }
    
    func run(){
        self.position.x += Utlities.gameSpeed[GameplayScene.level]!
    }
    
    func reverse(){
        self.yScale *= -1
    }
}


































