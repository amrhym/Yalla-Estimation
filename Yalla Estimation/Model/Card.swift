//
//  File.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
class Card {
    let Id : Int
    let Color : String
    let Num : String
    let Value : Int
    let ImageName : String
    
    init(id : Int , color : String, num : String , value : Int , imageName : String ) {
        Id = id
        Color = color
        Num = num
        Value = value
        ImageName = imageName
    }
}
