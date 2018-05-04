//
//  GameplayScene.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene, SKPhysicsContactDelegate{
    private var mainCamera: SKCameraNode?
    static var level: Level = .levelFour
 
    private var bg1: BGClass?
    private var bg2: BGClass?
    private var bg3: BGClass?

    private var ground1: GroundClass?
    private var ground2: GroundClass?
    private var ground3: GroundClass?

    private var floor1: GroundClass?
    private var floor2: GroundClass?
    private var floor3: GroundClass?

    private var player: Player?
    
    private var itemController = ItemController()
    
    private var scoreLabel: SKLabelNode?
    private var score: Int = 0
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    //MARK: Initialzation
    func initializeGame(){
        physicsWorld.contactDelegate = self
        
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
        
        bg1 = childNode(withName: "BG1") as? BGClass
        bg2 = childNode(withName: "BG2") as? BGClass
        bg3 = childNode(withName: "BG3") as? BGClass

        
        ground1 = childNode(withName: "Ground1") as? GroundClass
        ground2 = childNode(withName: "Ground2") as? GroundClass
        ground3 = childNode(withName: "Ground3") as? GroundClass
        ground1?.initializeGroundOrFloor()
        ground2?.initializeGroundOrFloor()
        ground3?.initializeGroundOrFloor()

        
        floor1 = childNode(withName: "Floor1") as? GroundClass
        floor2 = childNode(withName: "Floor2") as? GroundClass
        floor3 = childNode(withName: "Floor3") as? GroundClass
        floor1?.initializeGroundOrFloor()
        floor2?.initializeGroundOrFloor()
        floor3?.initializeGroundOrFloor()

        scoreLabel = mainCamera?.childNode(withName: "scoreLabel") as? SKLabelNode
        
        player = childNode(withName: "Player") as? Player
        player?.initializePlayer()
        
        Timer.scheduledTimer(timeInterval: TimeInterval(randomNumberBetwee(lower: 0.5, upper: 2.5)), target: self, selector: #selector(self.spawnItems), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: Utlities.WaitingTimeToRemoveMissedCoinsAndRockets, target: self, selector: #selector(self.removeMissedItems), userInfo: nil, repeats: true)
    }
    
    //MARK: Updating
    func updateCamera(){
        mainCamera?.position.x += Utlities.gameSpeed[GameplayScene.level]!
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
    
    func updatePlayer(){
        player?.run()
    }
    
    func updateRockets(){
        moveRockets()
    }
    override func update(_ currentTime: TimeInterval) {
        updateCamera()
        updateBGs()
        updateGroundsAndFloors()
        updatePlayer()
        updateRockets()
    }
    
    //MARK: Gravity
    func reverseGravity(){
        physicsWorld.gravity.dy *= -1
        player?.reverse()
    }
    
    //MARK: Interactions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reverseGravity()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "PLAYER"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "PLAYER" && secondBody.node?.name == "COIN"{
            score += 1
            scoreLabel?.text = String(score)
            secondBody.node?.removeFromParent()
        }
        
        if firstBody.node?.name == "PLAYER" && secondBody.node?.name == "ROCKET"{
            firstBody.node?.removeFromParent()
            secondBody.node?.removeFromParent()
            Timer.scheduledTimer(timeInterval: Utlities.WaitingTimeToRestart, target: self, selector: #selector(self.restartGame), userInfo: nil, repeats: false)
        }

    }
    
    
    //MARK: @objc Methods
    @objc func spawnItems(){
        self.addChild(itemController.spawnItem(using: mainCamera!))
    }
    
    @objc func restartGame(){
        if let scene = SKScene(fileNamed: "GameplayScene") as? GameplayScene {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.doorsOpenHorizontal(withDuration: 2.0))
        }
    }

    @objc func removeMissedItems(){
        for child in children{
            if child.name == "COIN" || child.name == "ROCKET"{
                if child.position.x < (self.mainCamera?.position.x)! - (self.scene?.frame.width)! / 2{
                    child.removeFromParent()
                }
            }
        }
    }

    //MARK: Other Methods
    func moveRockets(){
        enumerateChildNodes(withName: "ROCKET") { (node, error) in
            node.position.x -= Utlities.gameSpeed[GameplayScene.level]! / 4.0
        }
    }
    
    
}































