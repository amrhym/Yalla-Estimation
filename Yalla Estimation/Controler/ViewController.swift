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
    var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
    var swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
    var arreyOfUiView  = [UIImageView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        players[0].Userinfo.UserName = "amr"
        players[1].Userinfo.UserName = "sheko"
        players[2].Userinfo.UserName = "ahmed"
        players[3].Userinfo.UserName = "mohamed"
        
        players[0].Host = true
        DistributeCards()
        print(players[0].Userinfo.UserName)
        players[0].Cards = sortCards(cards : players[0].Cards )
        print(players[1].Userinfo.UserName)
        players[1].Cards = sortCards(cards : players[1].Cards )
        print(players[2].Userinfo.UserName)
        players[2].Cards = sortCards(cards : players[2].Cards )
        print(players[3].Userinfo.UserName)
        players[3].Cards = sortCards(cards : players[3].Cards )
        fillThCards(player: players[0], playerIndex: 3)
        //        fillThCards(player: players[1], playerIndex: 1)
        //        fillThCards(player: players[2], playerIndex: 2)
        //        fillThCards(player: players[3], playerIndex: 3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    //MARK: fill The Cards
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
                imageView.frame = CGRect(x: ((self.view.frame.width/13)*CGFloat(i-1)), y: CGFloat((yPos-20.0) + (self.view.frame.height/8)), width: ((self.view.frame.width/13)+15), height: 100.0)
                yPos = yPos - (3)
            }else{
                imageView.frame = CGRect(x: ((self.view.frame.width/13)*CGFloat(i-1)), y: CGFloat((yPos-20.0) + (self.view.frame.height/8)+3), width: ((self.view.frame.width/13)+15), height: 100.0)
                yPos = yPos + (3)
            }
            // print((playerIndex*13) + i)
            imageView.tag = (playerIndex*13) + i
            //let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.imagepanned))
            tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped))
            swipGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwipped))
            swipGestureRecognizer.direction = .up
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
            // imageView.addGestureRecognizer(panGestureRecognizer)
            imageView.addGestureRecognizer(swipGestureRecognizer)
            arreyOfUiView.append(imageView)
            view.addSubview(imageView)
            self.view.addSubview(imageView)
            i = i+1
        }
    }
    
    
    @objc func imageTapped(tapGest : UITapGestureRecognizer)
    {
        UIView.animate(withDuration: 0.1){
            if let thewindow = UIApplication.shared.keyWindow{
                tapGest.view?.frame = CGRect(x:(tapGest.view?.frame.origin.x)!,y:((tapGest.view?.frame.origin.y)!-15.0),width : (tapGest.view?.frame.width)! , height:(tapGest.view?.frame.height)!)
                print(tapGest.view?.tag)
                for view in self.arreyOfUiView {
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
                for view in self.arreyOfUiView {
                    view.isUserInteractionEnabled = true
                    if(view.tag == tapGest.view?.tag){
                        
                        view.isUserInteractionEnabled = false
                    }
                }
                
                
            }
        }
    }
    //MARK: calculate the call
    func calculateCall(cards : [Card]) -> Int{
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
        
        return 0 
    }
    //MARK: Sort the Distributed Cards
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
        for card in pCards{
            print(card.ImageName)
        }
        return  pCards
    }
    
    //MARK: Distribute the Cards
    func DistributeCards() {
        var roundCards = cards
        var y = 0
        
        while(roundCards.list.count > 0){
            let randomIndex = Int(arc4random_uniform(UInt32(roundCards.list.count-1)))
            
            players[y].Cards.append(roundCards.list[randomIndex])
            print(roundCards.list[randomIndex].ImageName)
            y = y + 1
            if y == 4{
                y = 0
            }
            roundCards.list.remove(at: randomIndex)
        }
    }
    
    
    
    
    
}
