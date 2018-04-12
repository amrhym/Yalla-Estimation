//
//  Cards.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
class Cards {
    var list = [Card]()
    
    init() {
        //MARK: list of Spade Cards
        list.append(Card(id: 0 , color: "spade", num: "ace", value: 13, imageName: "ace-S-1"))
        list.append(Card(id: 1 ,color: "spade", num: "king", value: 12, imageName: "king-S-1"))
        list.append(Card(id: 2 ,color: "spade", num: "queen", value: 11, imageName: "queen-S-1"))
        list.append(Card(id: 3 ,color: "spade", num: "jack", value: 10, imageName: "jack-S-1"))
        list.append(Card(id: 4 ,color: "spade", num: "ten", value: 9, imageName: "ten-S-1"))
        list.append(Card(id: 5 ,color: "spade", num: "nine", value: 8, imageName: "nine-S-1"))
        list.append(Card(id: 6 ,color: "spade", num: "eight", value: 7, imageName: "eight-S-1"))
        list.append(Card(id: 7 ,color: "spade", num: "seven", value: 6, imageName: "seven-S-1"))
        list.append(Card(id: 8 ,color: "spade", num: "six", value: 5, imageName: "six-S-1"))
        list.append(Card(id: 9 ,color: "spade", num: "five", value: 4, imageName: "five-S-1"))
        list.append(Card(id: 10 ,color: "spade", num: "four", value: 3, imageName: "four-S-1"))
        list.append(Card(id: 11 ,color: "spade", num: "three", value: 2, imageName: "three-S-1"))
        list.append(Card(id: 12 ,color: "spade", num: "two", value: 1, imageName: "two-S-1"))
        
        //MARK: list of Heart Cards
        list.append(Card(id: 13 ,color: "heart", num: "ace", value: 13, imageName: "ace-H-1"))
        list.append(Card(id: 14 ,color: "heart", num: "king", value: 12, imageName: "king-H-1"))
        list.append(Card(id: 15 ,color: "heart", num: "queen", value: 11, imageName: "queen-H-1"))
        list.append(Card(id: 16 ,color: "heart", num: "jack", value: 10, imageName: "jack-H-1"))
        list.append(Card(id: 17 ,color: "heart", num: "ten", value: 9, imageName: "ten-H-1"))
        list.append(Card(id: 18 ,color:  "heart", num: "nine", value: 8, imageName: "nine-H-1"))
        list.append(Card(id: 19 ,color:  "heart", num: "eight", value: 7, imageName: "eight-H-1"))
        list.append(Card(id: 20 ,color:  "heart", num: "seven", value: 6, imageName: "seven-H-1"))
        list.append(Card(id: 21 ,color:  "heart", num: "six", value: 5, imageName: "six-H-1"))
        list.append(Card(id: 22 ,color:  "heart", num: "five", value: 4, imageName: "five-H-1"))
        list.append(Card(id: 23 ,color:  "heart", num: "four", value: 3, imageName: "four-H-1"))
        list.append(Card(id: 24 ,color:  "heart", num: "three", value: 2, imageName: "three-H-1"))
        list.append(Card(id: 25 ,color:  "heart", num: "two", value: 1, imageName: "two-H-1"))
        
        //MARK: list of Diamond Cards
        list.append(Card(id: 26 ,color:  "diamond", num: "ace", value: 13, imageName: "ace-D-1"))
        list.append(Card(id: 27 ,color:  "diamond", num: "king", value: 12, imageName: "king-D-1"))
        list.append(Card(id: 28 ,color:  "diamond", num: "queen", value: 11, imageName: "queen-D-1"))
        list.append(Card(id: 29 ,color:  "diamond", num: "jack", value: 10, imageName: "jack-D-1"))
        list.append(Card(id: 30 ,color:  "diamond", num: "ten", value: 9, imageName: "ten-D-1"))
        list.append(Card(id: 31 ,color:  "diamond", num: "nine", value: 8, imageName: "nine-D-1"))
        list.append(Card(id: 32 ,color:  "diamond", num: "eight", value: 7, imageName: "eight-D-1"))
        list.append(Card(id: 33 ,color:  "diamond", num: "seven", value: 6, imageName: "seven-D-1"))
        list.append(Card(id: 34 ,color:  "diamond", num: "six", value: 5, imageName: "six-D-1"))
        list.append(Card(id: 35 ,color:  "diamond", num: "five", value: 4, imageName: "five-D-1"))
        list.append(Card(id: 36 ,color:  "diamond", num: "four", value: 3, imageName: "four-D-1"))
        list.append(Card(id: 37 ,color:  "diamond", num: "three", value: 2, imageName: "three-D-1"))
        list.append(Card(id: 38 ,color:  "diamond", num: "two", value: 1, imageName: "two-D-1"))
        
        //MARK: list of Club Cards
        list.append(Card(id: 39 ,color:  "club", num: "ace", value: 13, imageName: "ace-C-1"))
        list.append(Card(id: 40 ,color:  "club", num: "king", value: 12, imageName: "king-C-1"))
        list.append(Card(id: 41 ,color:  "club", num: "queen", value: 11, imageName: "queen-C-1"))
        list.append(Card(id: 42 ,color:  "club", num: "jack", value: 10, imageName: "jack-C-1"))
        list.append(Card(id: 43 ,color:  "club", num: "ten", value: 9, imageName: "ten-C-1"))
        list.append(Card(id: 44 ,color:  "club", num: "nine", value: 8, imageName: "nine-C-1"))
        list.append(Card(id: 45 ,color:  "club", num: "eight", value: 7, imageName: "eight-C-1"))
        list.append(Card(id: 46 ,color:  "club", num: "seven", value: 6, imageName: "seven-C-1"))
        list.append(Card(id: 47 ,color:  "club", num: "six", value: 5, imageName: "six-C-1"))
        list.append(Card(id: 48 ,color:  "club", num: "five", value: 4, imageName: "five-C-1"))
        list.append(Card(id: 49 ,color:  "club", num: "four", value: 3, imageName: "four-C-1"))
        list.append(Card(id: 50 ,color:  "club", num: "three", value: 2, imageName: "three-C-1"))
        list.append(Card(id: 51 ,color:  "club", num: "two", value: 1, imageName: "two-C-1"))
    }
}
