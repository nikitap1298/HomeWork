//
//  User.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 12.07.2022.
//

import UIKit

class User {
    static let singleton = User(userInfo: [String: Int](), userName: "", userScore: 0)
    
    var userInfo: [String: Int]
    var userName: String
    var userScore: Int
    
    private init(userInfo: [String: Int], userName: String, userScore: Int) {
        self.userInfo = userInfo
        self.userName = userName
        self.userScore = userScore
    }
}
