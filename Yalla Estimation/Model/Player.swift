//
//  Player.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class Player : Object   {
    @objc dynamic var Userinfo : User? = User()
    @objc dynamic var IsHost : Bool = false
    var Cards = List<PlayerCard>()
    var PlayedCards = List<PlayerCard>()
    var TricksCard = List<PlayerCard>()
    var Card_Power = List<CardPower>()
    @objc dynamic var Trumb : CardPower? = CardPower()
    @objc dynamic var TricksInTrumb : Int = 0
    @objc dynamic var TricksOutTrumb : Int = 0
    @objc dynamic var TotalOfTricks : Int = 0
    @objc dynamic var IsPass : Bool = false
    @objc dynamic var IsWith : Bool = false
    @objc dynamic var Call_l : Call? = Call()
    @objc dynamic var Score : Int = 0
    @objc dynamic var RequiredTricks : Int = 0
    @objc dynamic var ActualTricks : Int = 0
    @objc dynamic var RemainingTricks : Int = 0
    @objc dynamic var IsDashCall :Bool = false
    @objc dynamic var IsWinner :Bool = false
    @objc dynamic var IsLoser :Bool = false
    @objc dynamic var IsRisk :Bool = false
    @objc dynamic var IsDoubleRisk :Bool = false
    @objc dynamic var IsTribleRisk :Bool = false
    @objc dynamic var IsStart :Bool = false
    @objc dynamic var IsTurn :Bool = false
    @objc dynamic var IsCaller :Bool = false
    @objc dynamic var StillNeed :Bool = false
    @objc dynamic var IsDidDashCall :Bool = false
    @objc dynamic var IsDidCall :Bool = false
    @objc dynamic var IsDidConfirmCall :Bool = false

    let game = LinkingObjects(fromType: Game.self, property: "Players")
   
//    init() {
//    }
//    convenience init(user : User , host : Bool, cards : [Card], cardPower : [CardPower], trumb : CardPower , tricksInTrumb : Int, tricksOutTrumb : Int,totalOfTricks : Int , isPass : Bool , isWith: Bool, call_l:Call ,score:Int,requiredTricks:Int ,actualTricks : Int,isDashCall:Bool,isWinner:Bool,isLoser:Bool,isRisk:Bool,isDoubleRisk:Bool,isTribleRisk:Bool) {
//        self.init()
//        Userinfo = user
//        Host = host
//        Cards = cards
//        Card_Power = cardPower
//        Trumb = trumb
//        TricksInTrumb = tricksInTrumb
//        TricksOutTrumb = tricksOutTrumb
//        TotalOfTricks = totalOfTricks
//        IsPass = isPass
//        IsWith = isWith
//        Call_l = call_l
//        Score = score
//        RequiredTricks = requiredTricks
//        ActualTricks = actualTricks
//        IsDashCall = isDashCall
//        IsWinner = isWinner
//        IsLoser = isLoser
//        IsRisk = isRisk
//        IsDoubleRisk = isDoubleRisk
//        IsTribleRisk = isTribleRisk
//
//    }
}
