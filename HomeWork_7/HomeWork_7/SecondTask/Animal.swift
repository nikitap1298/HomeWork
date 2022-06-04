//
//  Animal.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import Foundation

class Animal {
    
    // MARK: - Public Properties
    var name: String
    var maxAge: Int
    var speed: Int
    
    init(name: String, maxAge: Int, speed: Int) {
        self.name = name
        self.maxAge = maxAge
        self.speed = speed
    }
}
