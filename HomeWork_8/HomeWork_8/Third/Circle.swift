//
//  Circle.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 07.06.2022.
//

import UIKit

class CircleViewController: UIViewController {
    
    // MARK: - Private Properties
    private var circle = UIView()
    
    // MARK: - IBOutlet
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        circle.backgroundColor = .red
        circle.frame = CGRect(x: xCenter - 60 / 2, y: yCenter - 60 / 2, width: 60, height: 60)
        circle.layer.cornerRadius = 30
        view.addSubview(circle)
        
        view.addGestureRecognizer(swipeGesture(for: .up))
        view.addGestureRecognizer(swipeGesture(for: .left))
        view.addGestureRecognizer(swipeGesture(for: .right))
        view.addGestureRecognizer(swipeGesture(for: .down))
    }
    
    @objc private func didSwipe(recognizer: UISwipeGestureRecognizer) {
        switch recognizer.direction {
        case .up:
            if circle.frame.minY >= view.frame.minY + 60 {
                circle.frame.origin.y -= 30
                textLabel.text = "Up"
            } else {
                textLabel.text = "Error"
            }
        case .left:
            if circle.frame.minX > view.frame.minX + 30 {
                circle.center.x -= 30
                textLabel.text = "Left"
            } else {
                textLabel.text = "Error"
            }
        case .right:
            if circle.frame.maxX <= view.frame.maxX - 30 {
                circle.center.x += 30
                textLabel.text = "Right"
            } else {
                textLabel.text = "Error"
            }
        case .down:
            if circle.frame.maxY <= CGFloat(800.0) {
                circle.center.y += 30
                textLabel.text = "Down"
            } else {
                textLabel.text = "Error"
            }
        default:
            print("Error")
        }
        
    }
    
    // MARK: - Private Function
    // Helps to avoid code diplication when create gesture recognizers
    private func swipeGesture(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        // Init Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(recognizer: )))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
}
