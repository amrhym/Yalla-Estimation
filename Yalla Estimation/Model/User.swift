//
//  File.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
import RealmSwift
class User : Object{
    @objc dynamic var UserName : String = ""
    @objc dynamic var Id : Int = 0
//    init() {
//    }
//    convenience init(userName : String , id : Int){
//        self.init()
//        UserName = userName
//        Id = id
//    }
}
