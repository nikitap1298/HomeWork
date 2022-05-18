//
//  Beer.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import Foundation

class Beer {
    static let shared = Beer()
    
    private var name: String = "Berliner Kindl"
    private var price: Double = 0.35
    private var country: String = "Germany"
    private var remainingVolume: Int = 50
    
    private init() { }
    
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
    
//    func startNewDay() -> Int {
//        return remainingVolume
//    }
}
