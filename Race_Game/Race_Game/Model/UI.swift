//
//  UI.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

struct UI {
    
    static var road: UIView = {
        let road = UIView()
        road.backgroundColor = UIColor(named: "colorRoad")
        road.translatesAutoresizingMaskIntoConstraints = false
        return road
    }()
    
    static var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.backgroundColor = UIColor(named: "colorYellow")
        leftButton.setTitle("<-", for: .normal)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        return leftButton
    }()
    
    static var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.backgroundColor = UIColor(named: "colorYellow")
        rightButton.setTitle("->", for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        return rightButton
    }()
    
    static var whiteLine: UIView = {
        let whiteLine = UIView()
        whiteLine.backgroundColor = .white
        whiteLine.translatesAutoresizingMaskIntoConstraints = false
        return whiteLine
    }()
    
    static var car: UIImageView = {
        let car = UIImageView()
        car.image = UIImage(named: "car")
        car.translatesAutoresizingMaskIntoConstraints = false
        return car
    }()
    
    static var carCenterX: NSLayoutConstraint?
}
