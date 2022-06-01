//
//  ThirdViewController.swift
//  HomeWork_6
//
//  Created by Nikita Pishchugin on 26.05.2022.
//

import UIKit

// For iPhone 13 Pro
class ThirdViewController: UIViewController {
    
    //MARK: - Enum
    private enum Direction {
        case up
        case left
        case right
        case down
    }
    
    //MARK: - Private Properties
    private let circle = UIView()
    
    //MARK: - IBOutlet
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Direction"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        circle.backgroundColor = .red
        circle.frame = CGRect(x: xCenter - 60 / 2, y: yCenter - 60 / 2, width: 60, height: 60)
        circle.layer.cornerRadius = 30
        view.addSubview(circle)
    }
    
    //MARK: - IBActions
    @IBAction func upButton(_ sender: UIButton) {
        move(.up)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        move(.left)
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        move(.right)
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        move(.down)
    }
    
    //MARK: - Private Functions
    
    private func move(_ direction: Direction) {
        switch direction {
        case .up:
            if circle.frame.minY >= view.frame.minY + 10 {
                circle.center.y -= 10
                textLabel.text = "\(direction)"
            } else {
                textLabel.text = "Error"
            }
        case .left:
            if circle.frame.minX > view.frame.minX + 10 {
                circle.center.x -= 10
                textLabel.text = "\(direction)"
            } else {
                textLabel.text = "Error"
            }
        case .right:
            if circle.frame.maxX <= view.frame.maxX - 10 {
                circle.center.x += 10
                textLabel.text = "\(direction)"
            } else {
                textLabel.text = "Error"
            }
        case .down:
            if circle.frame.maxY <= CGFloat(580.0) {
                circle.center.y += 10
                textLabel.text = "\(direction)"
            } else {
                textLabel.text = "Error"
            }
        }
    }

}
