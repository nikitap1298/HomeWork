//
//  AllSettings.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 11.07.2022.
//

import UIKit

class AllSettings {
    static let singleton = AllSettings(carColor: UIColor.systemYellow, barrier: UIImage(named: "Grass_Image")!, name: "Nikita", speed: 2.5)
    
    var carColor: UIColor
    var barrier: UIImage
    var name: String
    var speed: Double
    
    private init(carColor: UIColor, barrier: UIImage, name: String, speed: Double) {
        self.carColor = carColor
        self.barrier = barrier
        self.name = name
        self.speed = speed
    }
}
