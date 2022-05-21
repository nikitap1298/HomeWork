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
    
    func sellOne() -> String {
        if isWorking == 0 {
            Pub.singleton.beer[isWorking].remainingVolume -= 1
            sell0 += 1
            earn0 = Double(sell0) * Pub.singleton.beer[isWorking].price
        } else if isWorking == 1 {
            Pub.singleton.beer[isWorking].remainingVolume -= 1
            sell1 += 1
            earn1 = Double(sell1) * Pub.singleton.beer[isWorking].price
        } else if isWorking == 2 {
            Pub.singleton.beer[isWorking].remainingVolume -= 1
            sell2 += 1
            earn2 = Double(sell2) * Pub.singleton.beer[isWorking].price
        }
        return String("\(Pub.singleton.beer[0].remainingVolume); \(Pub.singleton.beer[1].remainingVolume); \(Pub.singleton.beer[2].remainingVolume)")
    }
    
    
    func earning() -> Double {
        let earn = earn0 + earn1 + earn2
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        earn0 = 0
        earn1 = 0
        earn2 = 0
        return earning()
    }
    
    func checkRemaining() -> String {
        sell0 = 0
        sell1 = 0
        sell2 = 0
        return String("\(Pub.singleton.beer[0].remainingVolume); \(Pub.singleton.beer[1].remainingVolume); \(Pub.singleton.beer[2].remainingVolume)")
    }
    
}
