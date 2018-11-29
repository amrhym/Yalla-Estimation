//
//  Trick.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/14/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class Trick : Object{
    @objc dynamic var num : Int = 0
    let Cards = List<PlayerCard>()
    let round = LinkingObjects(fromType: Round.self, property: "Tricks")
//    var PWinner : Int = 0
    
//    init() {
//
//    }
//    convenience init(p0Card : Card , p1Card : Card ,p2Card : Card ,p3Card : Card , pWinner : Int) {
//        self.init()
//        P0Card = p0Card
//        P1Card = p1Card
//        P2Card = p2Card
//        P3Card = p3Card
//        PWinner = pWinner
//    }
}
