//
//  CardCalculation.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/13/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift

class CardCalculation{
    //MARK: Get Color Cards
    func getColorCard(cards : List<PlayerCard> , trumbColor : String) -> List<PlayerCard>{
        var colorCards = List<PlayerCard>()
        
        for card in cards {
            
            if(card.Color == trumbColor){
                colorCards.append(card)
            }
        }
        
        return colorCards
    }
    
    //MARK: prepare to calculate calculate the call
    func prepareToCalculate(cards : List<PlayerCard>) -> List<CardPower>{
        var SpadeCards = List<PlayerCard>()
        var HeartCards = List<PlayerCard>()
        var ClubCards = List<PlayerCard>()
        var DiamondCards = List<PlayerCard>()
        var masterSpadePower = CardPower()
        var masterHeartPower = CardPower()
        var masterDiamondPower = CardPower()
        var masterClubPower = CardPower()
        var ListOfCardPower = List<CardPower>()
        var pCards = List<PlayerCard>()
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
        for c in SpadeCards{
            masterSpadePower.Color = "spade"
            if(c.ImageName.starts(with: "ace")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 13
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                masterSpadePower.HeighCard = 13
                masterSpadePower.HasAce = true
            }
            else if(c.ImageName.starts(with: "king")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 12
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 13){
                    masterSpadePower.HeighCard = 12
                }
                masterSpadePower.HasKing = true
            }
            else if(c.ImageName.starts(with: "queen")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 11
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 12){
                    masterSpadePower.HeighCard = 11
                }
                masterSpadePower.HasQueen = true
            }
            else if(c.ImageName.starts(with: "jack")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 10
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 11){
                    masterSpadePower.HeighCard = 10
                }
                masterSpadePower.HasJack = true
            }
            else if(c.ImageName.starts(with: "ten")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 9
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 10){
                    masterSpadePower.HeighCard = 9
                }
                masterSpadePower.HasTen = true
            }
            else if(c.ImageName.starts(with: "nine")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 8
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 9){
                    masterSpadePower.HeighCard = 8
                }
                masterSpadePower.HasNine = true
            }
            else if(c.ImageName.starts(with: "eight")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 7
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 8){
                    masterSpadePower.HeighCard = 7
                }
                masterSpadePower.HasEight = true
            }
            else if(c.ImageName.starts(with: "seven")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 6
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 7){
                    masterSpadePower.HeighCard = 6
                }
                masterSpadePower.HasSeven = true
            }
            else if(c.ImageName.starts(with: "six")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 5
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 6){
                    masterSpadePower.HeighCard = 5
                }
                masterSpadePower.HasSix = true
            }
            else if(c.ImageName.starts(with: "five")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 4
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 5){
                    masterSpadePower.HeighCard = 4
                }
                masterSpadePower.HasFive = true
            }
            else if(c.ImageName.starts(with: "four")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 3
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 4){
                    masterSpadePower.HeighCard = 3
                }
                masterSpadePower.HasFour = true
            }
            else if(c.ImageName.starts(with: "three")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 2
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 3){
                    masterSpadePower.HeighCard = 2
                }
                masterSpadePower.HasThree = true
            }
            else if(c.ImageName.starts(with: "two")){
                masterSpadePower.CardPower = masterSpadePower.CardPower + 1
                masterSpadePower.CardCount = masterSpadePower.CardCount + 1
                if(masterSpadePower.HeighCard < 2){
                    masterSpadePower.HeighCard = 1
                }
                masterSpadePower.HasTwo = true
            }
            
        }
        for c in HeartCards{
            masterHeartPower.Color = "heart"
            if(c.ImageName.starts(with: "ace")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 13
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                masterHeartPower.HeighCard = 13
                masterHeartPower.HasAce = true
            }
            if(c.ImageName.starts(with: "king")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 12
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 13){
                    masterHeartPower.HeighCard = 12
                }
                masterHeartPower.HasKing = true
            }
            if(c.ImageName.starts(with: "queen")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 11
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 12){
                    masterHeartPower.HeighCard = 11
                }
                masterHeartPower.HasQueen = true
            }
            if(c.ImageName.starts(with: "jack")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 10
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 11){
                    masterHeartPower.HeighCard = 10
                }
                masterHeartPower.HasJack = true
            }
            else if(c.ImageName.starts(with: "ten")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 9
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 10){
                    masterHeartPower.HeighCard = 9
                }
                masterHeartPower.HasTen = true
            }
            else if(c.ImageName.starts(with: "nine")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 8
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 9){
                    masterHeartPower.HeighCard = 8
                }
                masterHeartPower.HasNine = true
            }
            else if(c.ImageName.starts(with: "eight")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 7
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 8){
                    masterHeartPower.HeighCard = 7
                }
                masterHeartPower.HasEight = true
            }
            else if(c.ImageName.starts(with: "seven")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 6
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 7){
                    masterHeartPower.HeighCard = 6
                }
                masterHeartPower.HasSeven = true
            }
            else if(c.ImageName.starts(with: "six")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 5
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 6){
                    masterHeartPower.HeighCard = 5
                }
                masterHeartPower.HasSix = true
            }
            else if(c.ImageName.starts(with: "five")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 4
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 5){
                    masterHeartPower.HeighCard = 4
                }
                masterHeartPower.HasFive = true
            }
            else if(c.ImageName.starts(with: "four")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 3
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 4){
                    masterHeartPower.HeighCard = 3
                }
                masterHeartPower.HasFour = true
            }
            else if(c.ImageName.starts(with: "three")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 2
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 3){
                    masterHeartPower.HeighCard = 2
                }
                masterHeartPower.HasThree = true
            }
            else if(c.ImageName.starts(with: "two")){
                masterHeartPower.CardPower = masterHeartPower.CardPower + 1
                masterHeartPower.CardCount = masterHeartPower.CardCount + 1
                if(masterHeartPower.HeighCard < 2){
                    masterHeartPower.HeighCard = 1
                }
                masterHeartPower.HasTwo = true
            }
        }
        for c in ClubCards{
            masterClubPower.Color = "club"
            if(c.ImageName.starts(with: "ace")){
                masterClubPower.CardPower = masterClubPower.CardPower + 13
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                masterClubPower.HeighCard = 13
                masterClubPower.HasAce = true
            }
            if(c.ImageName.starts(with: "king")){
                masterClubPower.CardPower = masterClubPower.CardPower + 12
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 13){
                    masterClubPower.HeighCard = 12
                }
                masterClubPower.HasKing = true
            }
            if(c.ImageName.starts(with: "queen")){
                masterClubPower.CardPower = masterClubPower.CardPower + 11
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 12){
                    masterClubPower.HeighCard = 11
                }
                masterClubPower.HasQueen = true
            }
            if(c.ImageName.starts(with: "jack")){
                masterClubPower.CardPower = masterClubPower.CardPower + 10
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 11){
                    masterClubPower.HeighCard = 10
                }
                masterClubPower.HasJack = true
            }
            else if(c.ImageName.starts(with: "ten")){
                masterClubPower.CardPower = masterClubPower.CardPower + 9
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 10){
                    masterClubPower.HeighCard = 9
                }
                masterClubPower.HasTen = true
            }
            else if(c.ImageName.starts(with: "nine")){
                masterClubPower.CardPower = masterClubPower.CardPower + 8
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 9){
                    masterClubPower.HeighCard = 8
                }
                masterClubPower.HasNine = true
            }
            else if(c.ImageName.starts(with: "eight")){
                masterClubPower.CardPower = masterClubPower.CardPower + 7
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 8){
                    masterClubPower.HeighCard = 7
                }
                masterClubPower.HasEight = true
            }
            else if(c.ImageName.starts(with: "seven")){
                masterClubPower.CardPower = masterClubPower.CardPower + 6
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 7){
                    masterClubPower.HeighCard = 6
                }
                masterClubPower.HasSeven = true
            }
            else if(c.ImageName.starts(with: "six")){
                masterClubPower.CardPower = masterClubPower.CardPower + 5
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 6){
                    masterClubPower.HeighCard = 5
                }
                masterClubPower.HasSix = true
            }
            else if(c.ImageName.starts(with: "five")){
                masterClubPower.CardPower = masterClubPower.CardPower + 4
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 5){
                    masterClubPower.HeighCard = 4
                }
                masterClubPower.HasFive = true
            }
            else if(c.ImageName.starts(with: "four")){
                masterClubPower.CardPower = masterClubPower.CardPower + 3
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 4){
                    masterClubPower.HeighCard = 3
                }
                masterClubPower.HasFour = true
            }
            else if(c.ImageName.starts(with: "three")){
                masterClubPower.CardPower = masterClubPower.CardPower + 2
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 3){
                    masterClubPower.HeighCard = 2
                }
                masterClubPower.HasThree = true
            }
            else if(c.ImageName.starts(with: "two")){
                masterClubPower.CardPower = masterClubPower.CardPower + 1
                masterClubPower.CardCount = masterClubPower.CardCount + 1
                if(masterClubPower.HeighCard < 2){
                    masterClubPower.HeighCard = 1
                }
                masterClubPower.HasTwo = true
            }
        }
        for c in DiamondCards{
            masterDiamondPower.Color = "diamond"
            if(c.ImageName.starts(with: "ace")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 13
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                masterDiamondPower.HeighCard = 13
                masterDiamondPower.HasAce = true
            }
            if(c.ImageName.starts(with: "king")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 12
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 13){
                    masterDiamondPower.HeighCard = 12
                }
                masterDiamondPower.HasKing = true
            }
            if(c.ImageName.starts(with: "queen")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 11
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 12){
                    masterDiamondPower.HeighCard = 11
                }
                masterDiamondPower.HasQueen = true
            }
            if(c.ImageName.starts(with: "jack")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 10
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 11){
                    masterDiamondPower.HeighCard = 10
                }
                masterDiamondPower.HasJack = true
            }
            else if(c.ImageName.starts(with: "ten")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 9
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 10){
                    masterDiamondPower.HeighCard = 9
                }
                masterDiamondPower.HasTen = true
            }
            else if(c.ImageName.starts(with: "nine")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 8
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 9){
                    masterDiamondPower.HeighCard = 8
                }
                masterDiamondPower.HasNine = true
            }
            else if(c.ImageName.starts(with: "eight")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 7
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 8){
                    masterDiamondPower.HeighCard = 7
                }
                masterDiamondPower.HasEight = true
            }
            else if(c.ImageName.starts(with: "seven")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 6
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 7){
                    masterDiamondPower.HeighCard = 6
                }
                masterDiamondPower.HasSeven = true
            }
            else if(c.ImageName.starts(with: "six")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 5
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 6){
                    masterDiamondPower.HeighCard = 5
                }
                masterDiamondPower.HasSix = true
            }
            else if(c.ImageName.starts(with: "five")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 4
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 5){
                    masterDiamondPower.HeighCard = 4
                }
                masterDiamondPower.HasFive = true
            }
            else if(c.ImageName.starts(with: "four")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 3
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 4){
                    masterDiamondPower.HeighCard = 3
                }
                masterDiamondPower.HasFour = true
            }
            else if(c.ImageName.starts(with: "three")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 2
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 3){
                    masterDiamondPower.HeighCard = 2
                }
                masterDiamondPower.HasThree = true
            }
            else if(c.ImageName.starts(with: "two")){
                masterDiamondPower.CardPower = masterDiamondPower.CardPower + 1
                masterDiamondPower.CardCount = masterDiamondPower.CardCount + 1
                if(masterDiamondPower.HeighCard < 2){
                    masterDiamondPower.HeighCard = 1
                }
                masterDiamondPower.HasTwo = true
            }
        }
        
        print ("Spade power : \(masterSpadePower.CardPower)")
        print ("Spade count : \(masterSpadePower.CardCount)")
        print ("Spade heigh card : \(masterSpadePower.HeighCard)")
        print ("Master Spade power Ace: \(masterSpadePower.HasAce)")
        print ("Master Spade power King: \(masterSpadePower.HasKing)")
        print ("Master Spade power Queen: \(masterSpadePower.HasQueen)")
        print ("Master Spade power Jack: \(masterSpadePower.HasJack)")
        print ("Heart power : \(masterHeartPower.CardPower)")
        print ("Heart count : \(masterHeartPower.CardCount)")
        print ("Heart heigh card : \(masterHeartPower.HeighCard)")
        print ("Master Heart power Ace: \(masterHeartPower.HasAce)")
        print ("Master Heart power King: \(masterHeartPower.HasKing)")
        print ("Master Heart power Queen: \(masterHeartPower.HasQueen)")
        print ("Master Heart power Jack: \(masterHeartPower.HasJack)")
        print ("Club power : \(masterClubPower.CardPower)")
        print ("Club count : \(masterClubPower.CardCount)")
        print ("Club heigh card : \(masterClubPower.HeighCard)")
        print ("Master Club power Ace: \(masterClubPower.HasAce)")
        print ("Master Club power King: \(masterClubPower.HasKing)")
        print ("Master Club power Queen: \(masterClubPower.HasQueen)")
        print ("Master Club power Jack: \(masterClubPower.HasJack)")
        print ("Diamond power : \(masterDiamondPower.CardPower)")
        print ("Diamond count : \(masterDiamondPower.CardCount)")
        print ("Diamond heigh card : \(masterDiamondPower.HeighCard)")
        print ("Master Diamond power Ace: \(masterDiamondPower.HasAce)")
        print ("Master Diamond power King: \(masterDiamondPower.HasKing)")
        print ("Master Diamond power Queen: \(masterDiamondPower.HasQueen)")
        print ("Master Diamond power Jack: \(masterDiamondPower.HasJack)")
        
        ListOfCardPower.append(masterSpadePower)
        ListOfCardPower.append(masterHeartPower)
        ListOfCardPower.append(masterClubPower)
        ListOfCardPower.append(masterDiamondPower)
        return ListOfCardPower
    }
    //MARK: add to trick cards
    func addToTrickCards(cards : List<PlayerCard> , cardName : String , Trickcards : List<PlayerCard>){
        for card in cards {
            if(card.ImageName.contains(cardName)){
                Trickcards.append(card)
            }
        }
    }
    
    //MARK: add to trick cards
    func addHeightCardsToTrickCards(cards : List<PlayerCard> , numberOfTrick : Int , Trickcards : List<PlayerCard>){
        var i : Int = 1
        Trickcards.removeAll()
        var c = cards
        c.reverse()
        for card in cards {
            if(i <= numberOfTrick){
            Trickcards.append(card)
            }else{
                break
            }
            i = i + 1
        }
       
    }
    //MARK: Calculate in Trumb
    func calculatInTrumb(cardPower: CardPower , cards : List<PlayerCard> , TricksCards : List<PlayerCard>)->Int{
        var num = 0
        if(cardPower.HasAce){
            num = num + 1
            addToTrickCards(cards: cards, cardName: "ace", Trickcards: TricksCards)
        }
        if(cardPower.HasKing && cardPower.CardCount > 1){
            num = num + 1
            addToTrickCards(cards: cards, cardName: "king", Trickcards: TricksCards)
        }
        if(cardPower.HasQueen && cardPower.CardCount > 2){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "queen", Trickcards: TricksCards)
        }
        if(cardPower.HasJack && cardPower.CardCount > 3){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "jack", Trickcards: TricksCards)
        }
        if(cardPower.HasTen && cardPower.CardCount > 4){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "ten", Trickcards: TricksCards)
        }
        if(cardPower.HasNine && cardPower.CardCount > 4){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "nine", Trickcards: TricksCards)
        }
        if(cardPower.HasEight && cardPower.CardCount > 5 && cardPower.CardPower >= 44 && cardPower.HeighCard > 10){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "eight", Trickcards: TricksCards)
        }else if(cardPower.HasEight && cardPower.CardCount > 5 && cardPower.CardPower >= 30 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "eight", Trickcards: TricksCards)
        }else if(cardPower.HasEight && cardPower.CardCount >= 5 && cardPower.CardPower >= 30 && cardPower.HeighCard > 11 && (cardPower.HasJack || cardPower.HasQueen)){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "eight", Trickcards: TricksCards)
        }
        if(cardPower.HasSeven && cardPower.CardCount > 5 && cardPower.CardPower >= 48 && cardPower.HeighCard > 10){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "seven", Trickcards: TricksCards)
        }else if(cardPower.HasSeven && cardPower.CardCount >= 5 && cardPower.CardPower >= 34 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "seven", Trickcards: TricksCards)
        }
        if(cardPower.HasSix && cardPower.CardCount > 6 && cardPower.CardPower >= 57 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "six", Trickcards: TricksCards)
        }
        if(cardPower.HasFive && cardPower.CardCount > 6 && cardPower.CardPower >= 54 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "five", Trickcards: TricksCards)
        }
        if(cardPower.HasFour && cardPower.CardCount > 6 && cardPower.CardPower >= 65 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "four", Trickcards: TricksCards)
        }
        if(cardPower.HasThree && cardPower.CardCount > 6 && cardPower.CardPower >= 67 && cardPower.HeighCard > 11){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "three", Trickcards: TricksCards)
        }
        if(cardPower.HasTwo && cardPower.CardCount > 6 && cardPower.CardPower >= 70 && cardPower.HeighCard > 12){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "two", Trickcards: TricksCards)
        }
        if(cardPower.HasAce && cardPower.CardCount == 6 && !cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 3
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 6 && !cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 6 && cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 7
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack && cardPower.CardPower >= 39){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 7 && !cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack && cardPower.CardPower >= 36){
            num = 4
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack ){
            num = 5
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && !cardPower.HasQueen && !cardPower.HasJack ){
            num = 7
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack ){
            num = 7
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack ){
            num = 7
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && !cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(!cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && !cardPower.HasQueen && cardPower.HasJack ){
            num = 6
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && cardPower.HasQueen && !cardPower.HasJack ){
            num = 8
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        else if(cardPower.HasAce && cardPower.CardCount == 8 && cardPower.HasKing && cardPower.HasQueen && cardPower.HasJack ){
            num = 8
            addHeightCardsToTrickCards(cards: cards, numberOfTrick: num, Trickcards: TricksCards)
        }
        return num
    }
    
    //MARK: Select the Trumb
    func SelectTheTrumb(cardsPower: List<CardPower>)->CardPower{
        var power = cardsPower[0]
        if(cardsPower[1].CardCount > power.CardCount){
            power = cardsPower[1]
        }else if(cardsPower[1].CardCount == power.CardCount ){
            if(cardsPower[1].CardPower > power.CardPower){
                power = cardsPower[1]
            }
        }
        
        if(cardsPower[2].CardCount > power.CardCount){
            power = cardsPower[2]
        }else if(cardsPower[2].CardCount == power.CardCount ){
            if(cardsPower[2].CardPower > power.CardPower){
                power = cardsPower[2]
            }
        }
        
        if(cardsPower[3].CardCount > power.CardCount){
            power = cardsPower[3]
        }else if(cardsPower[3].CardCount == power.CardCount ){
            if(cardsPower[3].CardPower > power.CardPower){
                power = cardsPower[3]
            }
        }
        print("trumb color \(power.Color) ")
        return power
    }
    
    //MARK: Calculate out Trumb
    func calculatOutTrumb(cardPower: CardPower , CardsInTrumb : Int , cards : List<PlayerCard> , TricksCards : List<PlayerCard>)->Int{
        var num = 0
        if(cardPower.HasAce){
            num = num + 1
            addToTrickCards(cards: cards, cardName: "ace", Trickcards: TricksCards)
        }
        if(cardPower.HasKing && cardPower.CardCount > 1){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "king", Trickcards: TricksCards)
        }
        if(cardPower.HasQueen && cardPower.CardCount > 2 && cardPower.HasAce && cardPower.CardCount < 5){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "queen", Trickcards: TricksCards)
        }else if(cardPower.HasQueen && cardPower.CardCount > 2 && CardsInTrumb >= 5){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "queen", Trickcards: TricksCards)
        }
        if(cardPower.HasJack && cardPower.CardCount > 3 && CardsInTrumb >= 5){
            num = num + 1
             addToTrickCards(cards: cards, cardName: "jack", Trickcards: TricksCards)
        }
        //        if(cardPower.HasJack && cardPower.CardCount > 3){
        //            num = num + 1
        //        }
        return num
    }
    
    //MARK: Sort the Distributed Cards
    func sortCards(cards : List<PlayerCard>) ->List<PlayerCard>{
        var SpadeCards = List<PlayerCard>()
        var HeartCards = List<PlayerCard>()
        var ClubCards = List<PlayerCard>()
        var DiamondCards = List<PlayerCard>()
        var pCards = List<PlayerCard>()
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
    func DistributeCards(cards : List<PlayerCard>, players : List<Player>) {
        var roundCards = cards
        var y = 0
        
        while(roundCards.count > 0){
            let randomIndex = Int(arc4random_uniform(UInt32(roundCards.count-1)))
            
            players[y].Cards.append(roundCards[randomIndex])
            print(roundCards[randomIndex].ImageName)
            y = y + 1
            if y == 4{
                y = 0
            }
            roundCards.remove(at: randomIndex)
        }
    }
}
