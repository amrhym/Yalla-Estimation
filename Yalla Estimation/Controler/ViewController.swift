//
//  ViewController.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import UIKit
import SwiftyTimer
import ChameleonFramework
import RealmSwift

class ViewController: UIViewController {
    //MARK: constant
    var cards = Cards()
    var players = [Player(),Player(),Player(),Player()]
    let colorVolume : Dictionary<String,Int> = ["club":1 , "diamond":2 ,"heart":3 , "spade":4 , "suns":5]
    var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
    var swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
    var arreyOfUiCards  = [UIImageView]()
    var arrayOfButtonsCalls = [UIButton]()
    var arrayOfButtonsTrumb = [UIButton]()
    let playerCardsView = UIView()
    let robotCardsView = UIView()
    let callView = UIView()
    let dashCallView = UIView()
    let player1View = UIView()
    let player2View = UIView()
    let player3View = UIView()
    let RoundDetails = UIView()
    var DashCallPlayer = Player()
    var R = Round()
    var RS = [Round] ()
    var G = Game()
    var C = Call()
    let myUser = User()
    let realm = try! Realm()
    var games : Results<Game>!
    var ListOfCards = List<PlayerCard>()
    
    //MARK: did load
    override func viewDidLoad() {
        super.viewDidLoad()
        for card in cards.list{
            let c = PlayerCard()
            c.Color = card.Color
            c.Id = card.Id
            c.ImageName = card.ImageName
            c.Num = card.Num
            c.Value = card.Value
            ListOfCards.append(c)
        }
        loadMyInfo()
        self.view.backgroundColor = UIColor.flatForestGreenColorDark()
        //Should be Dynamic
        players[0].Userinfo?.UserName = "amr"
        players[0].Userinfo?.Id = 0
        
        players[1].Userinfo?.UserName = "sheko"
        players[1].Userinfo?.Id = 1
        players[2].Userinfo?.UserName = "ahmed"
        players[2].Userinfo?.Id = 2
        players[3].Userinfo?.UserName = "mohamed"
        players[3].Userinfo?.Id = 3
        
        joinToTheGame(user: (players[0].Userinfo)!)
        joinToTheGame(user: (players[1].Userinfo)!)
        joinToTheGame(user: (players[2].Userinfo)!)
        joinToTheGame(user: (players[3].Userinfo)!)
        
        G.CreateDate = Date()
        G.ModifiedDate = Date()
//        G.Players.append(players[0])
//        G.Players.append(players[1])
//        G.Players.append(players[2])
//        G.Players.append(players[3])
        let calc = CardCalculation()
        calc.DistributeCards(cards: ListOfCards, players: G.Players)
        print("**************** \(G.Players[0].Userinfo?.UserName)")
        G.Players[0].Cards = calc.sortCards(cards : G.Players[0].Cards )
        print("**************** \(G.Players[1].Userinfo?.UserName)")
        G.Players[1].Cards = calc.sortCards(cards : G.Players[1].Cards )
        print("**************** \(G.Players[2].Userinfo?.UserName)")
        G.Players[2].Cards = calc.sortCards(cards : G.Players[2].Cards )
        print("**************** \(G.Players[3].Userinfo?.UserName)")
        G.Players[3].Cards = calc.sortCards(cards : G.Players[3].Cards )
        do{
            try realm.write {
                G.Players[0].Cards.reverse()
                G.Players[1].Cards.reverse()
                G.Players[2].Cards.reverse()
                G.Players[3].Cards.reverse()
            }
        }catch{
            print("Error to modify in realm \(error)")
        }
        print("**************** \(G.Players[0].Userinfo?.UserName)")
        G.Players[0].Card_Power = calc.prepareToCalculate(cards: G.Players[0].Cards )
        G.Players[0].Trumb = calc.SelectTheTrumb(cardsPower: G.Players[0].Card_Power)
        var colorCardTrumb : List<PlayerCard> = calc.getColorCard(cards: G.Players[0].Cards, trumbColor: (G.Players[0].Trumb?.Color)!)
        G.Players[0].TricksInTrumb = calc.calculatInTrumb(cardPower: G.Players[0].Trumb!, cards: colorCardTrumb, TricksCards: G.Players[0].TricksCard)
        G.Players[0].TricksOutTrumb  = 0
        for card_Power in G.Players[0].Card_Power{
            if(card_Power.Color == G.Players[0].Trumb?.Color){
                
            }else{
                var colorCard : List<PlayerCard> = calc.getColorCard(cards: G.Players[0].Cards, trumbColor: (card_Power.Color))
                let tricks : Int = calc.calculatOutTrumb(cardPower: card_Power , CardsInTrumb : G.Players[0].TricksInTrumb, cards: colorCard, TricksCards: G.Players[0].TricksCard)
                G.Players[0].TricksOutTrumb = G.Players[0].TricksOutTrumb + tricks
                if(tricks > 0 ){
                    print("\(card_Power.Color)  : \(tricks)")
                }
            }
            
        }
        players[0].TotalOfTricks =  G.Players[0].TricksInTrumb + G.Players[0].TricksOutTrumb
        print ( "total \(G.Players[0].TotalOfTricks)")
        print ( "intrumb \(G.Players[0].TricksInTrumb)")
        print ( "outtrumb \(G.Players[0].TricksOutTrumb)")
        print("**************** \(G.Players[1].Userinfo?.UserName)")
        G.Players[1].Card_Power = calc.prepareToCalculate(cards: G.Players[1].Cards)
        G.Players[1].Trumb = calc.SelectTheTrumb(cardsPower: G.Players[1].Card_Power)
        colorCardTrumb  = calc.getColorCard(cards: G.Players[1].Cards, trumbColor: (G.Players[1].Trumb?.Color)!)
        G.Players[1].TricksInTrumb = calc.calculatInTrumb(cardPower: G.Players[1].Trumb!, cards: colorCardTrumb, TricksCards: G.Players[1].TricksCard)
        G.Players[1].TricksOutTrumb  = 0
        for card_Power in G.Players[1].Card_Power{
            if(card_Power.Color == G.Players[1].Trumb?.Color){
                
            }else{
                var colorCard : List<PlayerCard> = calc.getColorCard(cards: G.Players[1].Cards, trumbColor: (card_Power.Color))
                let tricks : Int = calc.calculatOutTrumb(cardPower: card_Power , CardsInTrumb : G.Players[1].TricksInTrumb, cards: colorCard, TricksCards: G.Players[1].TricksCard)
                G.Players[1].TricksOutTrumb = players[1].TricksOutTrumb + tricks
                if(tricks > 0 ){
                    print("\(card_Power.Color)  : \(tricks)")
                }
            }
            
        }
        G.Players[1].TotalOfTricks =  G.Players[1].TricksInTrumb + G.Players[1].TricksOutTrumb
        print ( "total \(G.Players[1].TotalOfTricks)")
        print ( "intrumb \(G.Players[1].TricksInTrumb)")
        print ( "outtrumb \(G.Players[1].TricksOutTrumb)")
        print("**************** \(G.Players[1].Userinfo?.UserName)")
        G.Players[2].Card_Power =  calc.prepareToCalculate(cards: G.Players[2].Cards)
        G.Players[2].Trumb = calc.SelectTheTrumb(cardsPower: G.Players[2].Card_Power)
        colorCardTrumb = calc.getColorCard(cards: G.Players[2].Cards, trumbColor: (G.Players[2].Trumb?.Color)!)
        G.Players[2].TricksInTrumb = calc.calculatInTrumb(cardPower: G.Players[2].Trumb!, cards: colorCardTrumb, TricksCards: G.Players[2].TricksCard)
        G.Players[2].TricksOutTrumb  = 0
        for card_Power in G.Players[2].Card_Power{
            if(card_Power.Color == G.Players[2].Trumb?.Color){
                
            }else{
                var colorCard : List<PlayerCard> = calc.getColorCard(cards: G.Players[2].Cards, trumbColor: (card_Power.Color))
                let tricks : Int = calc.calculatOutTrumb(cardPower: card_Power , CardsInTrumb : G.Players[2].TricksInTrumb, cards: colorCard, TricksCards: G.Players[2].TricksCard)
                G.Players[2].TricksOutTrumb = G.Players[2].TricksOutTrumb + tricks
                if(tricks > 0 ){
                    print("\(card_Power.Color)  : \(tricks)")
                }
            }
            
        }
        G.Players[2].TotalOfTricks =  G.Players[2].TricksInTrumb + G.Players[2].TricksOutTrumb
        print ( "total \(G.Players[2].TotalOfTricks)")
        print ( "intrumb \(G.Players[2].TricksInTrumb)")
        print ( "outtrumb \(G.Players[2].TricksOutTrumb)")
        print("**************** \(G.Players[3].Userinfo?.UserName)")
        G.Players[3].Card_Power = calc.prepareToCalculate(cards: G.Players[3].Cards)
        G.Players[3].Trumb = calc.SelectTheTrumb(cardsPower: G.Players[3].Card_Power)
        colorCardTrumb = calc.getColorCard(cards: G.Players[3].Cards, trumbColor: (G.Players[3].Trumb?.Color)!)
        G.Players[3].TricksInTrumb = calc.calculatInTrumb(cardPower: G.Players[3].Trumb!, cards: colorCardTrumb, TricksCards: G.Players[3].TricksCard)
        G.Players[3].TricksOutTrumb  = 0
        for card_Power in G.Players[3].Card_Power{
            if(card_Power.Color == G.Players[3].Trumb?.Color){
                
            }else{
                var colorCard : List<PlayerCard> = calc.getColorCard(cards: G.Players[3].Cards, trumbColor: (card_Power.Color))
                let tricks : Int = calc.calculatOutTrumb(cardPower: card_Power , CardsInTrumb : G.Players[3].TricksInTrumb, cards: colorCard, TricksCards: G.Players[3].TricksCard)
                G.Players[3].TricksOutTrumb = players[3].TricksOutTrumb + tricks
                if(tricks > 0 ){
                    print("\(card_Power.Color)  : \(tricks)")
                }
            }
            
        }
        G.Players[3].TotalOfTricks =  G.Players[3].TricksInTrumb + G.Players[3].TricksOutTrumb
        print ( "total \(G.Players[3].TotalOfTricks)")
        print ( "intrumb \(G.Players[3].TricksInTrumb)")
        print ( "outtrumb \(G.Players[3].TricksOutTrumb)")
        
        fillThCards(player: G.Players[0])
        
         fillPlayers()
        save(game: G)
        var startplayer = getWhoWillStart(Players: G.Players)
        var p = getTherNextPlayer(p: G.Players[0])
        print(p.Userinfo?.UserName)
        
        //playAgame()
        
        
        //fillDashCall(pl: startplayer)
        //fillToCall(pl:players[R.Turn])
        
  
        //fillRoundDetails(trumb: "spade", OverOrUner: -1)
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //MARK: Join To The Game
    func joinToTheGame(user :  User ){
        if(G.Players.count == 0){
            var p = Player()
            p.IsHost = true
            p.IsStart = true
            p.IsTurn = true
            p.Userinfo = user
            G.Players.append(p)
        }else if(G.Players.count < 4){
            var p = Player()
            p.Userinfo = user
            G.Players.append(p)
        }else{
            
        }
    }
    //MARK: play agame
    func playAgame(){
       var player = getWhoWillStart(Players: G.Players)
        if(G.Rounds.count == 0){
            var r = Round()
            r.Num = 1
            do{
                try realm.write {
                    G.Rounds.append(r)
                }
            }catch{
                print("Error to modify in realm \(error)")
            }
            
        }
        else if(G.Rounds[G.Rounds.count].IsFinished){
            var r = Round()
            r.Num = G.Rounds.count + 1
            do{
                try realm.write {
                    G.Rounds.append(r)
                }
            }catch{
                print("Error to modify in realm \(error)")
            }
        }
        else if(G.Rounds.count == 18){
            do{
                try realm.write {
                    G.IsFinished = true
                }
            }catch{
                print("Error to modify in realm \(error)")
            }
            
        }
        for player in G.Players {
            if(player.IsTurn){
                if((player.Userinfo?.Id == myUser.Id) ){
                    fillDashCall(pl: player)
                    
                }else{
                    
                }
            }
        }
    }
    //MARK:get the next player
    func getTherNextPlayer(p : Player)->Player{
        var nextPlayer = Player()
        var i = 0
        for player in G.Players {
            if(player.Userinfo?.Id == myUser.Id){
                if(i == 4){
                   nextPlayer = G.Players[0]
                   
                }else{
                    nextPlayer = G.Players[i+1]
                }
                
            }
            if(i == 4){
                i = 0
            }else{
                i = i + 1
            }
        }
        return nextPlayer
    }
    
    
    //MARK:Load My Information
    func loadMyInfo(){
        myUser.UserName = "amr"
        myUser.Id = 0
    }
    
    //MARK: load My self
    func loadMySelf()->Player{
       var p = Player()
        for player in G.Players {
            if(player.Userinfo?.Id == myUser.Id){
                p = player
            }
        }
        return p
    }
    
    
    //MARK: get who will start
    func getWhoWillStart(Players : List<Player>) -> Player{
       var player = Player()
        for p in Players {
            if(p.Userinfo?.Id == myUser.Id){
              //  print(p.Userinfo?.UserName)
                player = p
                break
            }
        }
        return player
    }
    //MARK: get who will Turn
    func getWhoWillTurn(Players : List<Player>) -> Player{
        var player = Player()
        for p in Players {
            if(p.IsTurn){
                player = p
                break
            }
        }
        return player
    }
    
    //MARK: Fill the DashBoard
    func fillDashCall(pl : Player){
         if(pl.Userinfo?.Id == myUser.Id){
            let width = self.view.frame.width/2.3
            let height = self.view.frame.height/2.5
            dashCallView.frame = CGRect(x: (self.view.frame.width/2)-(width/2), y: (self.view.frame.height/2)-(height/2), width: width, height: height)
            print(width )
            print(height)
            dashCallView.backgroundColor = UIColor.flatGray()
            dashCallView.layer.borderWidth = 3
            dashCallView.layer.borderColor = UIColor.flatGrayColorDark().cgColor
            self.view.addSubview(dashCallView)
            
            var labelHeight = height / 3
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: width , height: 2.0 * labelHeight))
           // label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            label.text = "Do you want DashCall ?"
            dashCallView.addSubview(label)
            DashCallPlayer = pl
            let buttonWidth = width/2
            let buttonHeight = height/3
            let NoButton = UIButton(frame: CGRect(x: 0 , y: 2.0 * buttonHeight, width: buttonWidth, height: buttonHeight))
            NoButton.backgroundColor = UIColor.flatRed()
            NoButton.tag = 141
            NoButton.addTarget(self, action: #selector(WantDashCall(sender:)), for: .touchDown)
           // NoButton.setImage(UIImage(named: "spade"), for: UIControlState.normal)
            NoButton.setTitle("No", for: .normal)
            dashCallView.addSubview(NoButton)
            
            let YesButton = UIButton(frame: CGRect(x: buttonWidth , y: 2.0 * buttonHeight, width: buttonWidth, height: buttonHeight))
            YesButton.backgroundColor = UIColor.flatGreen()
            YesButton.tag = 142
            YesButton.addTarget(self, action: #selector(WantDashCall(sender:)), for: .touchDown)
           // YesButton.setImage(UIImage(named: "spade"), for: UIControlState.normal)
            YesButton.setTitle("Yes", for: .normal)
            dashCallView.addSubview(YesButton)
         }else{
 
         }
        
    }
    //MARK: Fill To Call
    func fillToCall(pl : Player){
        if(pl.Userinfo?.Id == myUser.Id){
        let width = self.view.frame.width/2.3
        let height = self.view.frame.height/2.5
        callView.frame = CGRect(x: (self.view.frame.width/2)-(width/2), y: (self.view.frame.height/2)-(height/2), width: width, height: height)
        print(width )
        print(height)
        callView.backgroundColor = UIColor.flatGray()
        callView.layer.borderWidth = 3
        callView.layer.borderColor = UIColor.flatGrayColorDark().cgColor
        self.view.addSubview(callView)
        var selected : Bool = false
        var y = 0
        for i in 0...6 {
            let buttonWidth = width/9
            let buttonHeight = height/5
            let button = UIButton(frame: CGRect(x: 8 + (CGFloat(i)*(buttonWidth+5.0)), y: 8, width: buttonWidth, height: buttonHeight))
            button.setTitle(String(y), for: .normal)
            button.tag = y
            //button.backgroundColor = UIColor.flatGray()
            button.addTarget(self, action: #selector(selectTheCallValue(sender:)), for: .touchDown)
            arrayOfButtonsCalls.append(button)
            if(y < C.Num ){
                button.isEnabled = false
                button.backgroundColor = UIColor.flatBlackColorDark()
                button.setTitleColor(UIColor.flatGray(), for: .disabled)
                button.layer.cornerRadius = 5
            }else if(y == C.Num && C.Trumb == "suns"){
                button.isEnabled = false
                button.backgroundColor = UIColor.flatBlackColorDark()
                button.setTitleColor(UIColor.flatGray(), for: .disabled)
                button.layer.cornerRadius = 5
            }else{
                if(!selected){
                button.backgroundColor = UIColor.flatGrayColorDark()
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.flatWhite().cgColor
                button.layer.cornerRadius = 5
                selected = true
                }
            }
            y = y + 1
            callView.addSubview(button)
        }
        for i in 0...6 {
            let buttonWidth = width/9
            let buttonHeight = height/5
            let button = UIButton(frame: CGRect(x: 8 + (CGFloat(i)*(buttonWidth+5.0)), y: 13 + (buttonHeight), width: buttonWidth, height: buttonHeight))
            button.setTitle(String(y), for: .normal)
            button.tag = y
            button.addTarget(self, action: #selector(selectTheCallValue(sender:)), for: .touchDown)
            arrayOfButtonsCalls.append(button)
            if(y < C.Num ){
                button.isEnabled = false
                button.backgroundColor = UIColor.flatBlackColorDark()
                 button.setTitleColor(UIColor.flatGray(), for: .disabled)
                button.layer.cornerRadius = 5
            }else if(y == C.Num && C.Trumb == "suns"){
                button.isEnabled = false
                button.backgroundColor = UIColor.flatBlackColorDark()
                 button.setTitleColor(UIColor.flatGray(), for: .disabled)
                button.layer.cornerRadius = 5
            }else{
                if(!selected){
                    button.backgroundColor = UIColor.flatGrayColorDark()
                    button.layer.borderWidth = 1
                    button.layer.borderColor = UIColor.flatWhite().cgColor
                    button.layer.cornerRadius = 5
                    selected = true
                }
            }
            y = y + 1
            //  button.backgroundColor = UIColor.flatGray()
            //button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            callView.addSubview(button)
        }
        let buttonWidth = width/9
        let buttonHeight = height/5
        let SunsButton = UIButton(frame: CGRect(x: 8 + (0.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
        SunsButton.backgroundColor = UIColor.flatGray()
        SunsButton.tag = 14
        SunsButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
        SunsButton.setImage(UIImage(named: "suns"), for: UIControlState.normal)
        arrayOfButtonsTrumb.append(SunsButton)
        callView.addSubview(SunsButton)
        
        
        let SpadeButton = UIButton(frame: CGRect(x: 8 + (1.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
        SpadeButton.backgroundColor = UIColor.flatGray()
        SpadeButton.tag = 15
        SpadeButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
        SpadeButton.setImage(UIImage(named: "spade"), for: UIControlState.normal)
         arrayOfButtonsTrumb.append(SpadeButton)
        callView.addSubview(SpadeButton)
        
        let HeartButton = UIButton(frame: CGRect(x: 8 + (2.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
        HeartButton.backgroundColor = UIColor.flatGray()
        HeartButton.tag = 16
        HeartButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
        HeartButton.setImage(UIImage(named: "heart"), for: UIControlState.normal)
         arrayOfButtonsTrumb.append(HeartButton)
        callView.addSubview(HeartButton)
        
        let DiamondButton = UIButton(frame: CGRect(x: 8 + (3.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
        DiamondButton.backgroundColor = UIColor.flatGray()
        DiamondButton.tag = 17
        DiamondButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
        DiamondButton.setImage(UIImage(named: "diamond"), for: UIControlState.normal)
         arrayOfButtonsTrumb.append(DiamondButton)
        callView.addSubview(DiamondButton)
        
        let ClubButton = UIButton(frame: CGRect(x: 8 + (4.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
        ClubButton.backgroundColor = UIColor.flatGray()
        ClubButton.tag = 18
        ClubButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
        ClubButton.setImage(UIImage(named: "club"), for: UIControlState.normal)
         arrayOfButtonsTrumb.append(ClubButton)
        callView.addSubview(ClubButton)
        
        switch (C.Trumb){
        case "club":
            DiamondButton.backgroundColor = UIColor.flatGrayColorDark()
            DiamondButton.layer.borderWidth = 1
            DiamondButton.layer.cornerRadius = 5
            DiamondButton.layer.borderColor = UIColor.flatWhite().cgColor
        case "diamond":
            HeartButton.backgroundColor = UIColor.flatGrayColorDark()
            HeartButton.layer.borderWidth = 1
            HeartButton.layer.cornerRadius = 5
            HeartButton.layer.borderColor = UIColor.flatWhite().cgColor
        case "heart":
            SpadeButton.backgroundColor = UIColor.flatGrayColorDark()
            SpadeButton.layer.borderWidth = 1
            SpadeButton.layer.cornerRadius = 5
            SpadeButton.layer.borderColor = UIColor.flatWhite().cgColor
        case "spade":
            SunsButton.backgroundColor = UIColor.flatGrayColorDark()
            SunsButton.layer.borderWidth = 1
            SunsButton.layer.cornerRadius = 5
            SunsButton.layer.borderColor = UIColor.flatWhite().cgColor
        case "suns":
            ClubButton.backgroundColor = UIColor.flatGrayColorDark()
            ClubButton.layer.borderWidth = 1
            ClubButton.layer.cornerRadius = 5
            ClubButton.layer.borderColor = UIColor.flatWhite().cgColor
        default:
            ClubButton.backgroundColor = UIColor.flatGrayColorDark()
            ClubButton.layer.borderWidth = 1
            ClubButton.layer.cornerRadius = 5
            ClubButton.layer.borderColor = UIColor.flatWhite().cgColor
        }
            
        let passButton = UIButton(frame: CGRect(x: 8 + (5.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*3.2), width: buttonWidth+15.0, height: buttonHeight))
        passButton.backgroundColor = UIColor.flatGray()
        passButton.setTitle("PASS", for: .normal)
        passButton.tag = 130
        passButton.backgroundColor = UIColor.flatYellowColorDark()
        passButton.layer.borderWidth = 1
        passButton.layer.borderColor = UIColor.flatBlackColorDark().cgColor
        passButton.layer.cornerRadius = 8
        passButton.addTarget(self, action: #selector(putcall(sender:)), for: .touchDown)
        callView.addSubview(passButton)
        
        let CALLButton = UIButton(frame: CGRect(x: 25 + (6.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*3.2), width: buttonWidth+15.0, height: buttonHeight))
        CALLButton.backgroundColor = UIColor.flatGray()
        CALLButton.setTitle("CALL", for: .normal)
        CALLButton.backgroundColor = UIColor.flatRedColorDark()
        CALLButton.layer.borderWidth = 1
        CALLButton.tag = 131
        CALLButton.layer.borderColor = UIColor.flatBlackColorDark().cgColor
        CALLButton.layer.cornerRadius = 8
        CALLButton.addTarget(self, action: #selector(putcall(sender:)), for: .touchDown)
        callView.addSubview(CALLButton)
        //button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
        }else{
            pl.Call_l?.Num = pl.TotalOfTricks
           // pl.Call_l.Player_r = R.Turn
            pl.Call_l?.Trumb = (pl.Trumb?.Color)!
            if((pl.Call_l?.Num)! > C.Num){
                C.Num = (pl.Call_l?.Num)!
                //C.Player_r = pl.Call_l.Player_r
                C.Trumb = (pl.Call_l?.Trumb)!
            }else if(pl.Call_l?.Num == C.Num){
                if(colorVolume[(pl.Call_l?.Trumb)!]! > colorVolume[C.Trumb]!){
                    C.Num = (pl.Call_l?.Num)!
                   // C.Player_r = pl.Call_l.Player_r
                    C.Trumb = (pl.Call_l?.Trumb)!
                }else if(colorVolume[(pl.Call_l?.Trumb)!]! == colorVolume[C.Trumb]!){
                    
                }
            }
        }
    }
    //MARK: Fill To Call2
    func fillToCall2(pl : Player){
        if(pl.Userinfo?.Id == myUser.Id){
            let width = self.view.frame.width/2.3
            let height = self.view.frame.height/2.5
            callView.frame = CGRect(x: (self.view.frame.width/2)-(width/2), y: (self.view.frame.height/2)-(height/2), width: width, height: height)
            print(width )
            print(height)
            callView.backgroundColor = UIColor.flatGray()
            callView.layer.borderWidth = 3
            callView.layer.borderColor = UIColor.flatGrayColorDark().cgColor
            self.view.addSubview(callView)
            var selected : Bool = false
            var y = 0
            for i in 0...6 {
                let buttonWidth = width/9
                let buttonHeight = height/5
                let button = UIButton(frame: CGRect(x: 8 + (CGFloat(i)*(buttonWidth+5.0)), y: 8, width: buttonWidth, height: buttonHeight))
                button.setTitle(String(y), for: .normal)
                button.tag = y
                //button.backgroundColor = UIColor.flatGray()
                button.addTarget(self, action: #selector(selectTheCallValue(sender:)), for: .touchDown)
                arrayOfButtonsCalls.append(button)
                if(y < C.Num ){
                    button.isEnabled = false
                    button.backgroundColor = UIColor.flatBlackColorDark()
                    button.setTitleColor(UIColor.flatGray(), for: .disabled)
                    button.layer.cornerRadius = 5
                }else if(y == C.Num && C.Trumb == "suns"){
                    button.isEnabled = false
                    button.backgroundColor = UIColor.flatBlackColorDark()
                    button.setTitleColor(UIColor.flatGray(), for: .disabled)
                    button.layer.cornerRadius = 5
                }else{
                    if(!selected){
                        button.backgroundColor = UIColor.flatGrayColorDark()
                        button.layer.borderWidth = 1
                        button.layer.borderColor = UIColor.flatWhite().cgColor
                        button.layer.cornerRadius = 5
                        selected = true
                    }
                }
                y = y + 1
                callView.addSubview(button)
            }
            for i in 0...6 {
                let buttonWidth = width/9
                let buttonHeight = height/5
                let button = UIButton(frame: CGRect(x: 8 + (CGFloat(i)*(buttonWidth+5.0)), y: 13 + (buttonHeight), width: buttonWidth, height: buttonHeight))
                button.setTitle(String(y), for: .normal)
                button.tag = y
                button.addTarget(self, action: #selector(selectTheCallValue(sender:)), for: .touchDown)
                arrayOfButtonsCalls.append(button)
                if(y < C.Num ){
                    button.isEnabled = false
                    button.backgroundColor = UIColor.flatBlackColorDark()
                    button.setTitleColor(UIColor.flatGray(), for: .disabled)
                    button.layer.cornerRadius = 5
                }else if(y == C.Num && C.Trumb == "suns"){
                    button.isEnabled = false
                    button.backgroundColor = UIColor.flatBlackColorDark()
                    button.setTitleColor(UIColor.flatGray(), for: .disabled)
                    button.layer.cornerRadius = 5
                }else{
                    if(!selected){
                        button.backgroundColor = UIColor.flatGrayColorDark()
                        button.layer.borderWidth = 1
                        button.layer.borderColor = UIColor.flatWhite().cgColor
                        button.layer.cornerRadius = 5
                        selected = true
                    }
                }
                y = y + 1
                //  button.backgroundColor = UIColor.flatGray()
                //button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
                callView.addSubview(button)
            }
            let buttonWidth = width/9
            let buttonHeight = height/5
            let SunsButton = UIButton(frame: CGRect(x: 8 + (0.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
            SunsButton.backgroundColor = UIColor.flatGray()
            SunsButton.tag = 14
            SunsButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
            SunsButton.setImage(UIImage(named: "suns"), for: UIControlState.normal)
            arrayOfButtonsTrumb.append(SunsButton)
            callView.addSubview(SunsButton)
            
            
            let SpadeButton = UIButton(frame: CGRect(x: 8 + (1.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
            SpadeButton.backgroundColor = UIColor.flatGray()
            SpadeButton.tag = 15
            SpadeButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
            SpadeButton.setImage(UIImage(named: "spade"), for: UIControlState.normal)
            arrayOfButtonsTrumb.append(SpadeButton)
            callView.addSubview(SpadeButton)
            
            let HeartButton = UIButton(frame: CGRect(x: 8 + (2.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
            HeartButton.backgroundColor = UIColor.flatGray()
            HeartButton.tag = 16
            HeartButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
            HeartButton.setImage(UIImage(named: "heart"), for: UIControlState.normal)
            arrayOfButtonsTrumb.append(HeartButton)
            callView.addSubview(HeartButton)
            
            let DiamondButton = UIButton(frame: CGRect(x: 8 + (3.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
            DiamondButton.backgroundColor = UIColor.flatGray()
            DiamondButton.tag = 17
            DiamondButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
            DiamondButton.setImage(UIImage(named: "diamond"), for: UIControlState.normal)
            arrayOfButtonsTrumb.append(DiamondButton)
            callView.addSubview(DiamondButton)
            
            let ClubButton = UIButton(frame: CGRect(x: 8 + (4.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*2), width: buttonWidth, height: buttonHeight))
            ClubButton.backgroundColor = UIColor.flatGray()
            ClubButton.tag = 18
            ClubButton.addTarget(self, action: #selector(selectTheCallTrumb(sender:)), for: .touchDown)
            ClubButton.setImage(UIImage(named: "club"), for: UIControlState.normal)
            arrayOfButtonsTrumb.append(ClubButton)
            callView.addSubview(ClubButton)
            
            switch (C.Trumb){
            case "club":
                DiamondButton.backgroundColor = UIColor.flatGrayColorDark()
                DiamondButton.layer.borderWidth = 1
                DiamondButton.layer.cornerRadius = 5
                DiamondButton.layer.borderColor = UIColor.flatWhite().cgColor
            case "diamond":
                HeartButton.backgroundColor = UIColor.flatGrayColorDark()
                HeartButton.layer.borderWidth = 1
                HeartButton.layer.cornerRadius = 5
                HeartButton.layer.borderColor = UIColor.flatWhite().cgColor
            case "heart":
                SpadeButton.backgroundColor = UIColor.flatGrayColorDark()
                SpadeButton.layer.borderWidth = 1
                SpadeButton.layer.cornerRadius = 5
                SpadeButton.layer.borderColor = UIColor.flatWhite().cgColor
            case "spade":
                SunsButton.backgroundColor = UIColor.flatGrayColorDark()
                SunsButton.layer.borderWidth = 1
                SunsButton.layer.cornerRadius = 5
                SunsButton.layer.borderColor = UIColor.flatWhite().cgColor
            case "suns":
                ClubButton.backgroundColor = UIColor.flatGrayColorDark()
                ClubButton.layer.borderWidth = 1
                ClubButton.layer.cornerRadius = 5
                ClubButton.layer.borderColor = UIColor.flatWhite().cgColor
            default:
                ClubButton.backgroundColor = UIColor.flatGrayColorDark()
                ClubButton.layer.borderWidth = 1
                ClubButton.layer.cornerRadius = 5
                ClubButton.layer.borderColor = UIColor.flatWhite().cgColor
            }
            
            let passButton = UIButton(frame: CGRect(x: 8 + (5.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*3.2), width: buttonWidth+15.0, height: buttonHeight))
            passButton.backgroundColor = UIColor.flatGray()
            passButton.setTitle("PASS", for: .normal)
            passButton.tag = 130
            passButton.backgroundColor = UIColor.flatYellowColorDark()
            passButton.layer.borderWidth = 1
            passButton.layer.borderColor = UIColor.flatBlackColorDark().cgColor
            passButton.layer.cornerRadius = 8
            passButton.addTarget(self, action: #selector(putcall(sender:)), for: .touchDown)
            callView.addSubview(passButton)
            
            let CALLButton = UIButton(frame: CGRect(x: 25 + (6.0*(buttonWidth+5.0)), y: 18 + (buttonHeight*3.2), width: buttonWidth+15.0, height: buttonHeight))
            CALLButton.backgroundColor = UIColor.flatGray()
            CALLButton.setTitle("CALL", for: .normal)
            CALLButton.backgroundColor = UIColor.flatRedColorDark()
            CALLButton.layer.borderWidth = 1
            CALLButton.tag = 131
            CALLButton.layer.borderColor = UIColor.flatBlackColorDark().cgColor
            CALLButton.layer.cornerRadius = 8
            CALLButton.addTarget(self, action: #selector(putcall(sender:)), for: .touchDown)
            callView.addSubview(CALLButton)
            //button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
        }else{
            pl.Call_l?.Num = pl.TotalOfTricks
          //  pl.Call_l.Player_r = R.Turn
            pl.Call_l?.Trumb = (pl.Trumb?.Color)!
            if((pl.Call_l?.Num)! > C.Num){
                C.Num = (pl.Call_l?.Num)!
               // C.Player_r = pl.Call_l.Player_r
                C.Trumb = (pl.Call_l?.Trumb)!
            }else if(pl.Call_l?.Num == C.Num){
                if(colorVolume[(pl.Call_l?.Trumb)!]! > colorVolume[C.Trumb]!){
                    C.Num = (pl.Call_l?.Num)!
                 //   C.Player_r = pl.Call_l.Player_r
                    C.Trumb = (pl.Call_l?.Trumb)!
                }else if(colorVolume[(pl.Call_l?.Trumb)!]! == colorVolume[C.Trumb]!){
                    
                }
            }
        }
    }
    //MARK: Want Dash Call
    @objc func WantDashCall(sender: UIButton!){
        switch sender.tag {
        case 141:
            do{
                try realm.write {
                    DashCallPlayer.IsDashCall = false
                    var player = loadMySelf()
                    player.IsDidDashCall = true
                }
            }catch{
                print("Error to modify in realm \(error)")
            }
           
            dashCallView.isHidden = true
        case 142:
            do{
                try realm.write {
                    DashCallPlayer.IsDashCall = true
                    var player = loadMySelf()
                    player.IsDidDashCall = true
                }
            }catch{
                print("Error to modify in realm \(error)")
            }
            
            dashCallView.isHidden = true
        default:
            dashCallView.isHidden = true
        }
        
        
    }
    //MARK: select the call value
    @objc func putcall(sender: UIButton!){
        switch sender.tag {
        case 130:
            players[0].IsPass = true
            callView.isHidden = true
        case 131:
//            C.Num = players[R.Turn].Call_l.Num
//            C.Player_r = players[R.Turn].Call_l.Player_r
//            C.Trumb = players[R.Turn].Call_l.Trumb
            callView.isHidden = true
        default:
            callView.isHidden = true
        }
     
        
    }
    //MARK: select the call value
    @objc func selectTheCallValue(sender: UIButton!){
        print(sender.tag)
        sender.backgroundColor = UIColor.flatGrayColorDark()
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.flatWhite().cgColor
        sender.layer.cornerRadius = 5
//            players[R.Turn].Call_l.Player_r = 0
//            players[R.Turn].Call_l.Num = sender.tag
        
        for b in arrayOfButtonsCalls{
            if(b.tag == sender.tag){
                
            }else{
                if(b.isEnabled){
                    b.backgroundColor = UIColor.clear
                    b.layer.borderWidth = 0
                    b.layer.borderColor = UIColor.clear.cgColor
                    b.layer.cornerRadius = 0
                }
            }
        }
        
    }
    //MARK: select the call Trumb
    @objc func selectTheCallTrumb(sender: UIButton!){
        print(sender.tag)
        sender.backgroundColor = UIColor.flatGrayColorDark()
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = UIColor.flatWhite().cgColor
        for b in arrayOfButtonsTrumb{
            if(b.tag == sender.tag){
                
            }else{
                b.backgroundColor = UIColor.clear
                b.layer.borderWidth = 0
                b.layer.borderColor = UIColor.clear.cgColor
                b.layer.cornerRadius = 0
            }
        }
        switch sender.tag {
        case 14:
            players[0].Call_l?.Trumb = "suns"
        case 15:
            players[0].Call_l?.Trumb = "spade"
        case 16:
            players[0].Call_l?.Trumb = "heart"
        case 17:
            players[0].Call_l?.Trumb = "diamond"
        case 18:
            players[0].Call_l?.Trumb = "club"
        default:
            players[0].Call_l?.Trumb = ""
        }
       
    }
    //MARK: fill The Cards
    func fillThCards(player : Player){
        var playerCards : List<PlayerCard> = player.Cards
        var i : Int = 1
        //playerCards.reverse()
        let width = self.view.frame.width
        let height = self.view.frame.height/4
        playerCardsView.frame = CGRect(x: 0, y: (self.view.frame.height)-(height)+(height/4), width: width, height: height)
        //player1View.backgroundColor = UIColor.flatGray()
        self.view.addSubview(playerCardsView)
        
        var yPos = 0
        //  print(playerCards.count)
        for card in playerCards{
            var imageName = ""
            switch(card.Color){
            case "spade" :
                imageName = card.ImageName
                break
            case "heart" :
                imageName = card.ImageName
                break
            case "club" :
                imageName = card.ImageName
                break
            case "diamond" :
                imageName = card.ImageName
                break
            default:
                break
            }
            //  print(imageName)
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            let widthOfCard = (width/13) + (width/55)
            let heightOfCard = height
            if(i <= 6){
                imageView.frame = CGRect(x: ((width/13)*CGFloat(i-1)), y: CGFloat(yPos), width: widthOfCard , height: heightOfCard)
                yPos = yPos - (3)
                
            }else{
                imageView.frame = CGRect(x: ((width/13)*CGFloat(i-1)), y: CGFloat(yPos), width: widthOfCard, height: heightOfCard)
                yPos = yPos + (3)
            }
            // print((playerIndex*13) + i)
//            imageView.tag = (playerIndex*13) + i
            //let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.imagepanned))
//            tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
//            swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
//            swipGestureRecognizer.direction = .up
//            imageView.isUserInteractionEnabled = true
//            imageView.addGestureRecognizer(tapGestureRecognizer)
            // imageView.addGestureRecognizer(panGestureRecognizer)
            imageView.addGestureRecognizer(swipGestureRecognizer)
            arreyOfUiCards.append(imageView)
//            view.addSubview(imageView)
            playerCardsView.addSubview(imageView)
            i = i+1
        }
    }
    
    //MARK: fill The Cards Robot
    func fillThCardsforrobot(player : Player){
        var playerCards : List<PlayerCard> = player.Cards
        var i : Int = 1
//        do{
//            try realm.write {
//                 playerCards.reverse()
//            }
//        }catch{
//            print("Error to modify in realm \(error)")
//        }
       
        let width = self.view.frame.width
        let height = self.view.frame.height/4
        robotCardsView.frame = CGRect(x: 0, y: (self.view.frame.height)-(height)+(height/4), width: width, height: height)
        //player1View.backgroundColor = UIColor.flatGray()
        self.view.addSubview(robotCardsView)
        
        var yPos = 0
        //  print(playerCards.count)
        for card in playerCards{
            var imageName = ""
            switch(card.Color){
            case "spade" :
                imageName = card.ImageName
                break
            case "heart" :
                imageName = card.ImageName
                break
            case "club" :
                imageName = card.ImageName
                break
            case "diamond" :
                imageName = card.ImageName
                break
            default:
                break
            }
            //  print(imageName)
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            let widthOfCard = (width/13) + (width/55)
            let heightOfCard = height
            if(i <= 6){
                imageView.frame = CGRect(x: ((width/13)*CGFloat(i-1)), y: CGFloat(yPos), width: widthOfCard , height: heightOfCard)
                yPos = yPos - (3)
                
            }else{
                imageView.frame = CGRect(x: ((width/13)*CGFloat(i-1)), y: CGFloat(yPos), width: widthOfCard, height: heightOfCard)
                yPos = yPos + (3)
            }
            // print((playerIndex*13) + i)
            //imageView.tag = (playerIndex*13) + i
            //let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.imagepanned))
           // tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
           // swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
           // swipGestureRecognizer.direction = .up
           // imageView.isUserInteractionEnabled = true
           // imageView.addGestureRecognizer(tapGestureRecognizer)
            // imageView.addGestureRecognizer(panGestureRecognizer)
           // imageView.addGestureRecognizer(swipGestureRecognizer)
            arreyOfUiCards.append(imageView)
            //            view.addSubview(imageView)
            robotCardsView.addSubview(imageView)
            i = i+1
        }
    }
    @objc func imageTapped(tapGest : UITapGestureRecognizer)
    {
        UIView.animate(withDuration: 0.1){
            if let thewindow = UIApplication.shared.keyWindow{
                tapGest.view?.frame = CGRect(x:(tapGest.view?.frame.origin.x)!,y:((tapGest.view?.frame.origin.y)!-15.0),width : (tapGest.view?.frame.width)! , height:(tapGest.view?.frame.height)!)
                print(tapGest.view?.tag)
                for view in self.arreyOfUiCards {
                    view.isUserInteractionEnabled = false
                    if(view.tag == tapGest.view?.tag){
                        view.gestureRecognizers?.removeAll()
                        self.swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
                        self.swipGestureRecognizer.direction = .up
                        view.addGestureRecognizer(self.swipGestureRecognizer)
                        view.isUserInteractionEnabled = true
                    }
                }
                
            }
        }
    }
    
    @objc func imageSwipped(tapGest : UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3){
            if let thewindow = UIApplication.shared.keyWindow{
                //                for view in self.arreyOfUiView {
                //                    if(view.image == UIImage(named: "six-H-1")){
                //                        view.frame = CGRect(x:thewindow.frame.width/2,y:thewindow.frame.height/2 ,width : (tapGest.view?.frame.width)! , height:(tapGest.view?.frame.height)!)
                //                    }
                //                }
                tapGest.view?.frame = CGRect(x:thewindow.frame.width/2,y:thewindow.frame.height/2 ,width : (tapGest.view?.frame.width)! , height:(tapGest.view?.frame.height)!)
                print(tapGest.view?.tag)
                for view in self.arreyOfUiCards {
                    view.isUserInteractionEnabled = true
                    if(view.tag == tapGest.view?.tag){
                        
                        view.isUserInteractionEnabled = false
                    }
                }
                
                
            }
        }
      
        

    }
    
    //MARK: Fill the players
    func fillPlayers(){
        let width = self.view.frame.width/13
        let height = self.view.frame.height/4
        player1View.frame = CGRect(x: (self.view.frame.width)-(width*2), y: (self.view.frame.height/2)-(height/2), width: width, height: height)
        //player1View.backgroundColor = UIColor.flatGray()
        self.view.addSubview(player1View)
        let buttonWidth = width
        let buttonHeight = height/3
        let player1robot = UIButton(frame: CGRect(x: 0.0 , y: 0, width: buttonWidth, height: buttonHeight*2))
       // player1robot.backgroundColor = UIColor.flatGray()
        player1robot.setImage(UIImage(named: "robot"), for: UIControlState.normal)
        player1robot.tag = 20
        player1robot.addTarget(self, action: #selector(fill_thecard(sender:)), for: .touchDown)
        player1robot.addTarget(self, action: #selector(hide_thecard(sender:)), for: .touchUpInside)
        let player1TotalTrick =  UIButton(frame: CGRect(x: 0.0 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player1TotalTrick.setTitle(String(players[1].TotalOfTricks), for: .normal)
        let player1Trumb =  UIButton(frame: CGRect(x: buttonWidth/2 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player1Trumb.setImage(UIImage(named: (players[1].Trumb?.Color)!), for: UIControlState.normal)
        player1View.addSubview(player1TotalTrick)
        player1View.addSubview(player1Trumb)
        player1View.addSubview(player1robot)
        
      
        player2View.frame = CGRect(x: (self.view.frame.width/2)-(width/2), y: height/5.5, width: width, height: height/2)
       // player2View.backgroundColor = UIColor.flatGray()
        self.view.addSubview(player2View)
        let player2robot = UIButton(frame: CGRect(x: 0.0 , y: 0, width: buttonWidth, height: buttonHeight*2))
       // player2robot.backgroundColor = UIColor.flatGray()
        player2robot.setImage(UIImage(named: "robot"), for: UIControlState.normal)
        player2robot.tag = 21
        player2robot.addTarget(self, action: #selector(fill_thecard(sender:)), for: .touchDown)
        player2robot.addTarget(self, action: #selector(hide_thecard(sender:)), for: .touchUpInside)
        let player2TotalTrick =  UIButton(frame: CGRect(x: 0.0 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player2TotalTrick.setTitle(String(players[2].TotalOfTricks), for: .normal)
        let player2Trumb =  UIButton(frame: CGRect(x: buttonWidth/2 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player2Trumb.setImage(UIImage(named: (players[2].Trumb?.Color)!), for: UIControlState.normal)
        player2View.addSubview(player2TotalTrick)
        player2View.addSubview(player2Trumb)
        player2View.addSubview(player2robot)
        
        player3View.frame = CGRect(x: (width), y: (self.view.frame.height/2)-(height/2), width: width, height: height/2)
      //  player3View.backgroundColor = UIColor.flatGray()
        self.view.addSubview(player3View)
        let player3robot = UIButton(frame: CGRect(x: 0.0 , y: 0, width: buttonWidth, height: buttonHeight*2))
        //player3robot.backgroundColor = UIColor.flatGray()
        player3robot.setImage(UIImage(named: "robot"), for: UIControlState.normal)
        player3robot.tag = 22
        player3robot.addTarget(self, action: #selector(fill_thecard(sender:)), for: .touchDown)
        player3robot.addTarget(self, action: #selector(hide_thecard(sender:)), for: .touchUpInside)
        let player3TotalTrick =  UIButton(frame: CGRect(x: 0.0 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player3TotalTrick.setTitle(String(players[3].TotalOfTricks), for: .normal)
        let player3Trumb =  UIButton(frame: CGRect(x: buttonWidth/2 , y: buttonHeight*2, width: buttonWidth/2, height: buttonHeight))
        player3Trumb.setImage(UIImage(named: (players[3].Trumb?.Color)!), for: UIControlState.normal)
        player3View.addSubview(player3TotalTrick)
        player3View.addSubview(player3Trumb)
        player3View.addSubview(player3robot)
    }
    //MARK: Fill The Card of robot
    @objc func fill_thecard(sender : UIButton!){
        switch sender.tag {
        case 20:
            robotCardsView.isHidden = false
            fillThCardsforrobot(player: G.Players[1])
        case 21:
            robotCardsView.isHidden = false
            fillThCardsforrobot(player: G.Players[2])
        case 22:
            robotCardsView.isHidden = false
            fillThCardsforrobot(player: G.Players[3])
        default:
            robotCardsView.isHidden = true
        }
        
    }
    //MARK: hide The Card of robot
    @objc func hide_thecard(sender : UIButton!){
        robotCardsView.isHidden = true
    }
    
    //MARK: Fill the round Details
    func fillRoundDetails(trumb : String , OverOrUner : Int){
        let width = self.view.frame.width/12
        let height = self.view.frame.height/4
        RoundDetails.frame = CGRect(x: (self.view.frame.width)-(width*1.3), y: 20.0 , width: width, height: height)
       // RoundDetails.backgroundColor = UIColor.flatGray()
        self.view.addSubview(RoundDetails)
        let buttonWidth = width
        let buttonHeight = height/2
        let trumbButton = UIButton(frame: CGRect(x: 0.0 , y: 0, width: buttonWidth, height: buttonHeight))
        // player1robot.backgroundColor = UIColor.flatGray()
        // the trumb will be parameter************************************************
        trumbButton.setImage(UIImage(named: trumb), for: UIControlState.normal)
        RoundDetails.addSubview(trumbButton)
        let OverOrUnder = UIButton(frame: CGRect(x: 0.0 , y: buttonHeight, width: buttonWidth, height: buttonHeight))
        // player1robot.backgroundColor = UIColor.flatGray()
        // the overOrUnder will be parameter************************************************
        OverOrUnder.setTitle(String(OverOrUner), for: .normal)
        RoundDetails.addSubview(OverOrUnder)
    }
    
    //MARK:SAVE To Realm
    func save(game : Game){
        do{
            try realm.write {
                realm.add(game)
            }
        }catch{
            print("Error to add Game in realm \(error)")
        }
    }
    //MARK:Load the Game
    func loadTheGame(){
        games = realm.objects(Game.self)
    }
 
}
