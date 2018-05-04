//
//  itemController.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit

class ItemController{
    func spawnItem(using camera: SKCameraNode) -> SKSpriteNode{
        var item = SKSpriteNode()
        if randomNumberBetwee(lower: 1.0, upper: 10.0) >= 7.0{
            item = SKSpriteNode(imageNamed: "rocket")
            item.name = "ROCKET"
            item.xScale = 0.5
            item.yScale = 0.3
            item.physicsBody = SKPhysicsBody(rectangleOf: item.size)
        }else{ //So it's a Coin
            item = SKSpriteNode(imageNamed: "coin")
            item.name = "COIN"
            item.xScale = 0.3
            item.yScale = 0.3
            item.physicsBody = SKPhysicsBody(circleOfRadius: item.size.width / 2)
        }
        
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.isDynamic = false
        item.physicsBody?.categoryBitMask = ColliderType.ROCKETandCOLLECTABLES
        item.zPosition = 4
        item.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        item.position.x = camera.position.x + Utlities.HowRocketOrCoinFarFromTheMainCamera
        item.position.y = randomNumberBetwee(lower: Utlities.MinHeight, upper: Utlities.MaxHeight)
        return item
    }
}




















