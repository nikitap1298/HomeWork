//
//  Pub.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import Foundation

//MARK: - Pub
class Pub {
    
    static let singleton = Pub()
    var beer = Beer(name: "Berliner Kindl", price: 0.35, country: "Germany", remainingVolume: 50, total: 50)
    //let beer = Beer(name: "Pilsner Urquell", price: 0.31, country: "Czech Republic", remainingVolume: 35)
    
    func sellOne() {
        if beer.remainingVolume >= 1 {
            beer.remainingVolume -= 1
        }
    }
    
    func remaining() -> Int {
        return beer.remainingVolume 
    }
    
    func earning() -> Double {
        let earn = Double(beer.total - remaining()) * beer.price
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
}

//MARK: - Beer
class Beer {
    
    var name: String
    var price: Double
    var country: String
    var remainingVolume: Int
    var total: Int
    
    init(name: String, price: Double, country: String, remainingVolume: Int, total: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.remainingVolume = remainingVolume
        self.total = remainingVolume
    }
}
