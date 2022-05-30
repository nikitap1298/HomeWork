//
//  Beer.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 21.05.2022.
//

import Foundation

class Beer {
    
    //MARK: - Public Properties
    var name: String
    var price: Double
    var country: String
    var remainingVolume: Int
    var total: Int
    
    //MARK: - Life Cycle
    init(name: String, price: Double, country: String, remainingVolume: Int, total: Int) {
        self.name = name
        self.price = price
        self.country = country
        self.remainingVolume = remainingVolume
        self.total = total
    }
}
