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
    var sell1: Int = 0
    var sell2: Int = 0
    var isWorking: Int = 0
    
    private init(beer: [Beer]) {
        self.beer = beer
    }
    
    func sellOne() -> String {
        if Pub.singleton.beer[0].remainingVolume >= 1 && isWorking == 0 {
            Pub.singleton.beer[0].remainingVolume -= 1
            sell0 += 1
        } else if Pub.singleton.beer[1].remainingVolume >= 1 && isWorking == 1 {
            Pub.singleton.beer[1].remainingVolume -= 1
            sell1 += 1
        } else if Pub.singleton.beer[2].remainingVolume >= 1 && isWorking == 2 {
            Pub.singleton.beer[2].remainingVolume -= 1
            sell2 += 1
        }
        return String("\(Pub.singleton.beer[0].remainingVolume); \(Pub.singleton.beer[1].remainingVolume); \(Pub.singleton.beer[2].remainingVolume)")
    }
    
    
    func earning() -> Double {
        let earn = (Double(sell0) * beer[0].price) + (Double(sell1) * beer[1].price) + (Double(sell2) * beer[2].price)
        let earnTwoDigits = Double(round(1000 * earn)) / 1000
        return earnTwoDigits
    }
    
    func resetEarning() -> Double {
        sell0 = 0
        sell1 = 0
        sell2 = 0
        return earning()
    }
    
    func checkRemaining() -> String {
        return sellOne()
    }
    
}
