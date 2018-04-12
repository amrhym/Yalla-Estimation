//
//  Player.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
class Player{
    var Userinfo : User = User()
    var Host : Bool = false
    var Cards = [Card]()
    init() {
    }
    convenience init(user : User , host : Bool, cards : [Card]) {
        self.init()
        Userinfo = user
        Host = host
        Cards = cards
    }
}
