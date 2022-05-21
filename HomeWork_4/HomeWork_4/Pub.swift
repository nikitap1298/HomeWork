//
//  Pab.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import Foundation

//MARK: - Pub
class Pub {
    
    static let singleton = Pub()
    var beer = Beer(name: "Berliner Kindl", price: 0.39, country: "Germany", remainingVolume: 260)
    var beer1 = Beer(name: "Pilsner Urquell", price: 0.31, country: "Czech Republic", remainingVolume: 195)
    
    var sellNumber: Int = 0
    var remanining: Int
    
    private init() {
        remanining = beer1.remainingVolume
    }
    
    func sellOne() -> Int {
        if remanining >= 1 {
            remanining -= 1
            sellNumber += 1
        }
        return remanining
    }
    
    func earning() -> Double {
        let earn = Double(sellNumber) * beer.price
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        sellNumber = 0
        return earning()
    }
    
    func checkRemaining() -> Int {
        return remanining
    }
    
}

//MARK: - Beer
class Beer {
    
    var name: String
    var price: Double
    var country: String
    var remainingVolume: Int
    
    init(name: String, price: Double, country: String, remainingVolume: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.remainingVolume = remainingVolume
    }
}
