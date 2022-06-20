//
//  UsefulExtensions.swift
//  For All Projects
//
//  Created by Nikita Pishchugin on 20.06.2022.
//

import UIKit

// MARK: - UIView
extension UIView {
    
    // Add shadows
    func addShadow(shadowColor: UIColor = .black, offset: CGSize = .init(width: 10, height: 10), opacity: Float = 0.3, radius: CGFloat = 8) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    // Corner radius
    func addCornerRadius(divider: CGFloat = 2) {
        layer.cornerRadius = layer.frame.height / divider
    }
    
}

// MARK: - Int
extension Int {
    
    // Int to Double
    func toDouble() -> Double {
        Double(self)
    }
    
    // Int to String
    func toString() -> String {
        String(self)
    }
}

// MARK: - Double
extension Double {
    
    // Double to Int
    func toInt() -> Int {
        Int(self)
    }
    
    // Double to String
    func toString() -> String {
        String(self)
    }
}
