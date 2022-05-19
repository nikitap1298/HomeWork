//
//  Pub.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import Foundation

//MARK: - Pub
class Pub {
    
    static let singleton = Pub(total: 50)
    var beer = Beer(name: "Berliner Kindl", price: 0.35, country: "Germany", remainingVolume: 50)
    //let beer = Beer(name: "Pilsner Urquell", price: 0.31, country: "Czech Republic", remainingVolume: 35)
    
    var total: Int
    
    private init(total: Int) {
        self.total = total
    }
    
    func sellOne() -> Int {
        if beer.remainingVolume >= 1 {
            beer.remainingVolume -= 1
        }
        return beer.remainingVolume
    }
    
    func remaining() -> Int {
        return beer.remainingVolume 
    }
    
    func earning() -> Double {
        let earn = Double(total - remaining()) * beer.price
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
    
//    func reset() -> Double {
//        let resetEarn = Double(beer.total - remaining())
//        let resetEarnTwoDigits = Double(round(1000 * resetEarn)) / 1000
//        return resetEarnTwoDigits
//    }
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
