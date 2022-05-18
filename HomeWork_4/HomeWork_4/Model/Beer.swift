//
//  Beer.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import Foundation

class Beer {
    static let shared = Beer(name: "Berliner Kindl", price: 0.4, country: "German", remainingVolume: 50)
    
    var name: String
    var price: Double
    var country: String
    var remainingVolume: Int
    
    private init(name: String, price: Double, country: String, remainingVolume: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.remainingVolume = remainingVolume
    }
    
    func remaining() {
        remainingVolume -= 1
    }
    
    func earnings() -> Int {
        return remainingVolume
    }
}
