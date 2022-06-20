//
//  UsefulExtensions.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 20.06.2022.
//

import UIKit

extension UIView {
    func addShadow(shadowColor: UIColor = .black, offset: CGSize = .init(width: 10, height: 10), opacity: Float = 0.3, radius: CGFloat = 8) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
}
