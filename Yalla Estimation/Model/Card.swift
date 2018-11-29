//
//  File.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
class Card {
    var Id : Int = 0
    var Color : String = ""
    var Num : String = ""
    var Value : Int = 0
    var ImageName : String = ""
    init() {
        
    }
    convenience init(id : Int , color : String, num : String , value : Int , imageName : String ) {
       self.init()
        Id = id
        Color = color
        Num = num
        Value = value
        ImageName = imageName
    }
}
