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
    static let TotalHeight: CGFloat = 750.0 //Standard
    static let TotalWidth: CGFloat = 1334.0 //Standard
    static let MinHeight: CGFloat = -1.0 * (Utlities.TotalHeight / 2.0 - Utlities.RocketAndCoinHeight)
    static let MaxHeight: CGFloat = Utlities.TotalHeight / 2.0 - Utlities.RocketAndCoinHeight
    static let WaitingTimeToRestart: TimeInterval = 2.0
    
    //Player
    static let NumberOfTexturesPerPlayer: Int = 6
    static let PhysicsRectangleOfPlayer:CGSize = CGSize(width: 50.0, height: 100.0)
    
    //Rockets & Coins
    static let RocketAndCoinHeight: CGFloat = 100.0
    static let HowRocketOrCoinFarFromTheMainCamera: CGFloat = Utlities.TotalWidth / 2 + 150
    static let WaitingTimeToRemoveMissedCoinsAndRockets: TimeInterval = 7.0 //check every 7 seconds
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


func randomNumberBetwee(lower: CGFloat, upper: CGFloat) -> CGFloat {
    let randomNumber = CGFloat(arc4random_uniform(UInt32(upper - lower))) + lower
    return randomNumber
}























