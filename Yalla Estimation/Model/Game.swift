//
//  Game.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/14/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class Game :Object{
    @objc dynamic var Name : String = ""
    @objc dynamic var GameType : String = ""
    @objc dynamic var NumOfRound : Int = 0
    var Rounds = List<Round>()
    var Players = List<Player>()
    @objc dynamic var CreateDate = Date()
    @objc dynamic var ModifiedDate = Date()
    @objc dynamic var IsFinished : Bool = false
    
    
//    init() {
//        
//    }
//    convenience init(name : String ,gameType : String , numOfRound : Int , rounds : [Round] , players : [Player] ) {
//        self.init()
//        Name = name
//        GameType = gameType
//        NumOfRound = numOfRound
//        Rounds = rounds
//        Players = players
//       
//    }
    
}
