//
//  ViewController.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cards = Cards()
    let players = [Player(),Player(),Player(),Player()]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players[0].Userinfo.UserName = "amr"
        players[1].Userinfo.UserName = "sheko"
        players[2].Userinfo.UserName = "ahmed"
        players[3].Userinfo.UserName = "mohamed"
        
        players[0].Host = true
        DistributeCards()
        players[0].Cards = sortCards(cards : players[0].Cards )
        players[1].Cards = sortCards(cards : players[1].Cards )
        players[2].Cards = sortCards(cards : players[2].Cards )
        players[3].Cards = sortCards(cards : players[3].Cards )
        for i in 0...3 {
            print(players[i].Userinfo.UserName)
            for card in players[i].Cards {
                print("\(card.Color) - \(card.Num)")
            }
        }
        fillThCards(player: players[0], playerIndex: 0)
        fillThCards(player: players[1], playerIndex: 1)
        fillThCards(player: players[2], playerIndex: 2)
        fillThCards(player: players[3], playerIndex: 3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillThCards(player : Player,playerIndex : Int){
        var playerCards : [Card] = player.Cards
        

        
        var i : Int = 1
       playerCards.reverse()
        var yPos = (self.view.frame.height/4)*CGFloat(playerIndex)
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
            if(i <= 7){
                imageView.frame = CGRect(x: ((self.view.frame.width/13)*CGFloat(i-1)), y: CGFloat(yPos-3 ), width: ((self.view.frame.width/13)+10), height: 80.0)
//                imageView.frame = CGRect(x: (Int((self.view.frame.width/13))*(i-1)), y: yPos - (3) , width: (Int((self.view.frame.width/13))+10), height: 80)
                yPos = yPos - (3)
            }else{
                 imageView.frame = CGRect(x: ((self.view.frame.width/13)*CGFloat(i-1)), y: CGFloat(yPos+3), width: ((self.view.frame.width/13)+10), height: 80.0)
//                imageView.frame = CGRect(x: (Int((self.view.frame.width/13))*(i-1)), y: yPos + (3), width: (Int((self.view.frame.width/13))+5), height: 80)
                yPos = yPos + (3)
            }
           // print((playerIndex*13) + i)
            imageView.tag = (playerIndex*13) + i
            //                let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.imagepanned))
            //                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
            let swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
            swipGestureRecognizer.direction = .up
            imageView.isUserInteractionEnabled = true
            //               imageView.addGestureRecognizer(tapGestureRecognizer)
            //                imageView.addGestureRecognizer(panGestureRecognizer)
            imageView.addGestureRecognizer(swipGestureRecognizer)
            //arreyOfUiView.append(imageView)
            view.addSubview(imageView)
            self.view.addSubview(imageView)
            i = i+1
        }

        
        
        
    }
    @objc func imageSwipped(tapGest : UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 1.0){
            if let thewindow = UIApplication.shared.keyWindow{
                tapGest.view?.frame = CGRect(x:thewindow.frame.width - 15,y:thewindow.frame.height - 15 ,width : 10 , height:10)
                print(thewindow.tag)
                
                // thewindow.image = nil
                //thewindow.isHidden = true
            }
        }
        
        
    }
    func sortCards(cards : [Card]) ->[Card]{
        var SpadeCards = [Card]()
         var HeartCards = [Card]()
         var ClubCards = [Card]()
         var DiamondCards = [Card]()
        var pCards = [Card]()
        for card in cards {
            switch (card.Color){
            case "spade" :
            SpadeCards.append(card)
            break
            case "heart" :
            HeartCards.append(card)
            break
            case "diamond" :
             DiamondCards.append(card)
            break
            case "club" :
             ClubCards.append(card)
            break
            default:
            break
            }
        }
        for card in SpadeCards.sorted(by: { (Card1, Card2) -> Bool in
            Card2.Value > Card1.Value
        }){
            pCards.append(card)
        }
        for card in HeartCards.sorted(by: { (Card1, Card2) -> Bool in
            Card2.Value > Card1.Value
        }){
            pCards.append(card)
        }
        for card in ClubCards.sorted(by: { (Card1, Card2) -> Bool in
            Card2.Value > Card1.Value
        }){
            pCards.append(card)
        }
        for card in DiamondCards.sorted(by: { (Card1, Card2) -> Bool in
            Card2.Value > Card1.Value
        }){
            pCards.append(card)
        }
       return  pCards
    }
    
    func DistributeCards() {
        var roundCards = cards
        var y = 0
        
        while(roundCards.list.count > 0){
            let randomIndex = Int(arc4random_uniform(UInt32(roundCards.list.count-1)))
            players[y].Cards.append(roundCards.list[randomIndex])
            y = y + 1
            if y == 4{
                y = 0
            }
            roundCards.list.remove(at: randomIndex)
        }
    }
    @IBAction func roll(_ sender: Any) {
        cards = Cards()
        players[0].Userinfo.UserName = "amr"
        players[1].Userinfo.UserName = "sheko"
        players[2].Userinfo.UserName = "ahmed"
        players[3].Userinfo.UserName = "mohamed"
        players[0].Cards = [Card]()
        players[1].Cards = [Card]()
        players[2].Cards = [Card]()
        players[3].Cards = [Card]()
        players[0].Host = true
        DistributeCards()
        players[0].Cards = sortCards(cards : players[0].Cards )
        players[1].Cards = sortCards(cards : players[1].Cards )
        players[2].Cards = sortCards(cards : players[2].Cards )
        players[3].Cards = sortCards(cards : players[3].Cards )
        for i in 0...3 {
            print(players[i].Userinfo.UserName)
            for card in players[i].Cards {
                print("\(card.Color) - \(card.Num)")
            }
        }
        fillThCards(player: players[0], playerIndex: 0)
        fillThCards(player: players[1], playerIndex: 1)
        fillThCards(player: players[2], playerIndex: 2)
        fillThCards(player: players[3], playerIndex: 3)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print(UIDevice.current.orientation.isLandscape)
    }
}
