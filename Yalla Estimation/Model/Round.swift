//
//  Round.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/14/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class Round : Object{
    @objc dynamic var Trumb : String = ""
    @objc dynamic var OverOrUnder : Int = 0
    @objc dynamic var Num : Int = 0
    @objc dynamic var IsDouble : Bool = false
    @objc dynamic var NumOfLoser : Int = 0
    @objc dynamic var NumOfWinner : Int = 0
    @objc dynamic var IsFinished : Bool = false
    var Tricks = List<Trick>()
    let game = LinkingObjects(fromType: Game.self, property: "Rounds")
    
    
    
//    init() {
//
//    }
//    convenience init(trumb:String , overOrUnder:Int , num:Int  , isDouble:Bool , numOfLoser:Int , numOfWinner:Int ,   tricks : [Trick] , players : [Player]  ){
//        self.init()
//        Trumb = trumb
//        OverOrUnder = overOrUnder
//        Num = num
//        IsDouble = isDouble
//        NumOfLoser = numOfLoser
//        NumOfWinner = numOfWinner
//        Players = players
//        Tricks = tricks
//
//    }
}
