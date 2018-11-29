//
//  playercard.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/15/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class PlayerCard: Object {
    @objc dynamic var Id : Int = 0
    @objc dynamic var Color : String = ""
    @objc dynamic var Num : String = ""
    @objc dynamic var Value : Int = 0
    @objc dynamic var ImageName : String = ""
    let trick = LinkingObjects(fromType: Trick.self, property: "Cards")
    let player = LinkingObjects(fromType: Player.self, property: "Cards")
}
