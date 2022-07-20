//
//  User.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 12.07.2022.
//

import UIKit

class User {
    static let singleton = User(userInfo: [String: Int](), userName: "", userScore: 0, date: [String: String]())
    
    var userInfo: [String: Int]
    var userName: String
    var userScore: Int
    var date: [String: String]
    
    private init(userInfo: [String: Int], userName: String, userScore: Int, date: [String: String]) {
        self.userInfo = userInfo
        self.userName = userName
        self.userScore = userScore
        self.date = date
    }
}
