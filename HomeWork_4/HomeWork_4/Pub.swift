//
//  Pab.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import Foundation

//MARK: - Pub
class Pub {
    
    //MARK: - Public Properties
    static let singleton = Pub(beer: [])
    var beer: [Beer] = []
    
    //MARK: - Life Cycle
    private init(beer: [Beer]) {
        self.beer = beer
    }
    
    //MARK: - Public Functions
    func sellOne(n: Int) -> String {
        if Pub.singleton.beer[n].remainingVolume >= 1 {
            Pub.singleton.beer[n].remainingVolume -= 1
            Pub.singleton.beer[n].total += 1
        }
        return beer.map { ($0.name, $0.remainingVolume) }.toPrint
    }
    
    func earning() -> Double {
        
        // Convert beer array to output only earning for each Beer. Example: [0.39, 0.31, 0.28]
        let earnEach = beer.map { Double($0.total) * $0.price }
        
        // Sum all elements in earnEachArray
        let eachSum = earnEach.reduce(0) { (sum, num) -> Double in
            sum + num
        }
        let earnTwoDigits = Double(round(1000 * eachSum)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        
        // Reset total value to 0
        beer = beer.map { Beer(name: $0.name, price: $0.price, country: $0.country, remainingVolume: $0.remainingVolume, total: $0.total * 0 ) }
        return earning()
    }
    
    func checkRemaining() -> String {
        return beer.map { $0.remainingVolume }.toPrint
    }
    
}

//MARK: - Extensions
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
