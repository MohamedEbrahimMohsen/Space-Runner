//
//  Utlities.swift
//  Space Runner
//
//  Created by Mohamed Mohsen on 5/3/18.
//  Copyright © 2018 Mohamed Mohsen. All rights reserved.
//

import UIKit

struct Utlities{
    //Game
    static let gameSpeed: [Level:CGFloat] = [.levelOne: 10.0, .levelTwo: 15.0, .levelThree: 20.0,.levelFour: 25.0, .levelFive: 30.0,.levelSix: 50.0]
    static let TimeIntervalPerFrame: TimeInterval = 0.1
    
    //Player
    static let NumberOfTexturesPerPlayer: Int = 6
    static let PhysicsRectangleOfPlayer:CGSize = CGSize(width: 50.0, height: 100.0)
}


enum Level: Int{
    case levelOne
    case levelTwo
    case levelThree
    case levelFour
    case levelFive
    case levelSix
}

struct ColliderType{
    static let PLAYER: UInt32 = 0
    static let GROUND: UInt32 = 1
    static let ROCKETandCOLLECTABLES: UInt32 = 2
}
