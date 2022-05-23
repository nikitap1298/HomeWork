//
//  Pab.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import Foundation

//MARK: - Pub
class Pub {
    static let singleton = Pub(beer: [])
    var beer: [Beer] = []
    
    private init(beer: [Beer]) {
        self.beer = beer
    }
    
    func sellOne(n: Int) -> String {
        if Pub.singleton.beer[n].remainingVolume >= 1 {
            Pub.singleton.beer[n].remainingVolume -= 1
            Pub.singleton.beer[n].total += 1
        }
        return beer.map { $0.remainingVolume }.toPrint
    }
    
    
    func earning() -> Double {
        let earnEach = beer.map { Double($0.total) * $0.price }
        let eachSum = earnEach.reduce(0) { (sum, num) -> Double in
            sum + num
        }
        let earnTwoDigits = Double(round(1000 * eachSum)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        beer = beer.map { Beer(name: $0.name, price: $0.price, country: $0.country, remainingVolume: $0.remainingVolume, total: $0.total * 0 ) }
        return earning()
    }
    
    func checkRemaining() -> String {
        return beer.map { $0.remainingVolume }.toPrint
    }
    
}

// Remove [] in Array
extension Array {
    var toPrint: String  {
        var str = ""
        for element in self {
            str += "\(element) "
        }
        return str
    }
}
