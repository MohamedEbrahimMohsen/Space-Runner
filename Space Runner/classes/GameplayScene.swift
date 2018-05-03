//
//  GameplayScene.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene{
    private var mainCamera: SKCameraNode?
    private(set) var level: Level = .levelOne
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    private func initializeGame(){
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
    }
    
    func manageCamera(){
        mainCamera?.position.x += Constants.gameSpeed[level]!
    }
    
    override func update(_ currentTime: TimeInterval) {
        manageCamera()
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
    static let gameSpeed: [Level:CGFloat] = [.levelOne: 10.0, .levelTwo: 15.0, .levelThree: 20.0,.levelFour: 25.0, .levelFive: 30.0,.levelSix: 35.0]
    }
}
