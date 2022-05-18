//
//  Beer.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import Foundation

class Beer {
    static let shared = Beer(name: "Berliner Kindl", price: 0.35, country: "Germany", remainingVolume: 50)
    
    var name: String = "Berliner Kindl"
    var price: Double = 0.35
    var country: String = "Germany"
    var remainingVolume: Int = 50
    
    init(name: String, price: Double, country: String, remainingVolume: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.remainingVolume = remainingVolume
    }
    
    func sellOne() {
        if remainingVolume >= 1 {
            remainingVolume -= 1
        }
    }
    
    func remaining() -> Int {
        return remainingVolume
    }
    
    func earning() -> Double {
        let earn = Double(50 - remainingVolume) * price
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
}
