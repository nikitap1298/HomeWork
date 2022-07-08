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
    
    // Gradient
    func addGradient(_ firstColor: UIColor, _ secondColor: UIColor, _ gradientType: CAGradientLayerType) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.startPoint = .init(x: 0, y: 0)
        gradient.endPoint = .init(x: 1, y: 1)
        gradient.type = gradientType
        gradient.cornerRadius = layer.cornerRadius
        gradient.maskedCorners = [.layerMaxXMinYCorner]
        layer.addSublayer(gradient)
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

// MARK: - UIViewController
extension UIViewController {
    
    // Alert with 1 button
    func customAlertFirstAction(alertTitle: String?,
                              alertMessage: String?,
                              alertStyle: UIAlertController.Style,
                              actionTitle: String?,
                              actionStyle: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let firstAction = UIAlertAction(title: actionTitle, style: actionStyle) { action in
            
        }
        alert.addAction(firstAction)
        present(alert, animated: true)
    }
    
    // Alert with 2 buttons
    func customAlertSecondAction(alertTitle: String?,
                               alertMessage: String?,
                               alertStyle: UIAlertController.Style,
                               firstActionTitle: String?,
                               firstActionStyle: UIAlertAction.Style,
                               secondActionTitle: String?,
                               secondActionStyle: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let firstAction = UIAlertAction(title: firstActionTitle, style: firstActionStyle) { action in
            
        }
        let secondAction = UIAlertAction(title: secondActionTitle, style: secondActionStyle) { action in
            
        }
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        present(alert, animated: true)
    }
    
}
