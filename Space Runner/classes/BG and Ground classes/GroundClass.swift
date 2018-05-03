//
//  GroundClass.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit

class GroundClass: SKSpriteNode{
    func moveGroundsOrFloor(using camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x{
            self.position.x += self.size.width * 3
        }
    }
}
