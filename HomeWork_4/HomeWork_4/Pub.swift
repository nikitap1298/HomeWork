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
    
    var sell0: Int = 0
    var earn0: Double = 0
    var sell1: Int = 0
    var earn1: Double = 0
    var sell2: Int = 0
    var earn2: Double = 0
    var isWorking: Int = 0
    
    private init(beer: [Beer]) {
        self.beer = beer
    }
    
    func sellOne(n: Int) -> String {
        if isWorking == n {
            Pub.singleton.beer[isWorking].remainingVolume -= 1
            Pub.singleton.beer[isWorking].total += 1
        }
        return String("\(Pub.singleton.beer[0].remainingVolume); \(Pub.singleton.beer[1].remainingVolume); \(Pub.singleton.beer[2].remainingVolume)")
    }
    
    
    func earning() -> Double {
        let earn = (Double(Pub.singleton.beer[0].total) * Pub.singleton.beer[0].price) + (Double(Pub.singleton.beer[1].total) * Pub.singleton.beer[1].price) + (Double(Pub.singleton.beer[2].total) * Pub.singleton.beer[2].price)
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        Pub.singleton.beer[0].total = 0
        Pub.singleton.beer[1].total = 0
        Pub.singleton.beer[2].total = 0
        return earning()
    }
    
    func checkRemaining() -> String {
        return String("\(Pub.singleton.beer[0].remainingVolume); \(Pub.singleton.beer[1].remainingVolume); \(Pub.singleton.beer[2].remainingVolume)")
    }
    
}
