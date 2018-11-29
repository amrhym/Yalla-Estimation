//
//  CardPower.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/13/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class CardPower : Object{
    @objc dynamic var HasAce : Bool = false
    @objc dynamic var HasKing : Bool = false
    @objc dynamic var HasQueen : Bool = false
    @objc dynamic var HasJack : Bool = false
    @objc dynamic var HasTen : Bool = false
    @objc dynamic var HasNine : Bool = false
    @objc dynamic var HasEight : Bool = false
    @objc dynamic var HasSeven : Bool = false
    @objc dynamic var HasSix : Bool = false
    @objc dynamic var HasFive : Bool = false
    @objc dynamic var HasFour : Bool = false
    @objc dynamic var HasThree : Bool = false
    @objc dynamic var HasTwo : Bool = false
    @objc dynamic var CardPower : Int = 0
    @objc dynamic var CardCount : Int = 0
    @objc dynamic var HeighCard : Int = 0
    @objc dynamic var Color : String = ""
    let player = LinkingObjects(fromType: Player.self, property: "Card_Power")
    
//    init(){
//    }
//    convenience init(hasAce : Bool ,hasKing : Bool, hasQueen : Bool , hasJack : Bool ,hasTen : Bool ,hasNine : Bool ,hasEight : Bool , hasSeven : Bool , hasSix : Bool , hasFive : Bool ,hasFour : Bool ,hasThree : Bool , hasTwo : Bool, cardPower : Int , cardCount : Int , heighCard : Int,color : String ) {
//        self.init()
//        HasAce = hasAce
//        HasKing = hasKing
//        HasQueen = hasQueen
//        HasJack = hasJack
//        HasTen = hasTen
//        HasNine = hasNine
//        HasEight = hasEight
//        HasSeven = hasSeven
//        HasSix = hasSix
//        HasFive = hasFive
//        HasFour = hasFour
//        HasThree = hasThree
//        HasTwo = hasTwo
//        CardPower = cardPower
//        CardCount = cardCount
//        HeighCard = heighCard
//        Color = color
//    }
}
