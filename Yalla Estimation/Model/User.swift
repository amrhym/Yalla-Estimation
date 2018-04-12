//
//  File.swift
//  Yalla Estimation
//
//  Created by amr Elshendidy on 4/12/18.
//  Copyright © 2018 amr Elshendidy. All rights reserved.
//

import Foundation
class User {
    var UserName : String = ""
    init() {
    }
    convenience init(userName : String){
        self.init()
        UserName = userName
    }
}
