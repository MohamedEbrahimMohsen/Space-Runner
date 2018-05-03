//
//  GameplayScene.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene{
    private(set) var mainCamera: SKCameraNode?
    private(set) var level: Level = .levelSix
 
    private(set) var bg1: BGClass?
    private(set) var bg2: BGClass?
    private(set) var bg3: BGClass?

    private(set) var ground1: GroundClass?
    private(set) var ground2: GroundClass?
    private(set) var ground3: GroundClass?

    private(set) var floor1: GroundClass?
    private(set) var floor2: GroundClass?
    private(set) var floor3: GroundClass?

    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    func initializeGame(){
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
        
        bg1 = childNode(withName: "BG1") as? BGClass
        bg2 = childNode(withName: "BG2") as? BGClass
        bg3 = childNode(withName: "BG3") as? BGClass

        ground1 = childNode(withName: "Ground1") as? GroundClass
        ground2 = childNode(withName: "Ground2") as? GroundClass
        ground3 = childNode(withName: "Ground3") as? GroundClass

        
        floor1 = childNode(withName: "Floor1") as? GroundClass
        floor2 = childNode(withName: "Floor2") as? GroundClass
        floor3 = childNode(withName: "Floor3") as? GroundClass
    }
    
    func updateCamera(){
        mainCamera?.position.x += Constants.gameSpeed[level]!
    }
    
    func updateBGs(){
        bg1?.moveBG(using: mainCamera!)
        bg2?.moveBG(using: mainCamera!)
        bg3?.moveBG(using: mainCamera!)
    }
    
    func updateGroundsAndFloors(){
        ground1?.moveGroundsOrFloor(using: mainCamera!)
        ground2?.moveGroundsOrFloor(using: mainCamera!)
        ground3?.moveGroundsOrFloor(using: mainCamera!)

        floor1?.moveGroundsOrFloor(using: mainCamera!)
        floor2?.moveGroundsOrFloor(using: mainCamera!)
        floor3?.moveGroundsOrFloor(using: mainCamera!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        updateCamera()
        updateBGs()
        updateGroundsAndFloors()
    }
    enum Level: Int{
        case levelOne
        case levelTwo
        case levelThree
        case levelFour
        case levelFive
        case levelSix
    }
    
    struct Constants{
    static let gameSpeed: [Level:CGFloat] = [.levelOne: 10.0, .levelTwo: 15.0, .levelThree: 20.0,.levelFour: 25.0, .levelFive: 30.0,.levelSix: 50.0]
    }
}