//
//  User.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 12.07.2022.
//

import UIKit

class User {
    static let singleton = User(userInfo: [String: Int]())
    
    var userInfo: [String: Int]
    private init(userInfo: [String: Int]) {
        self.userInfo = userInfo
    }
}
