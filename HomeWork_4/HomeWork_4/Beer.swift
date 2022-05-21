//
//  Beer.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 21.05.2022.
//

import Foundation

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
