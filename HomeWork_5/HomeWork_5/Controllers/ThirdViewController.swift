//
//  ThirdViewController.swift
//  HomeWork_5
//
//  Created by Nikita Pishchugin on 26.05.2022.
//

import UIKit

// For iPhone 13 Pro
class ThirdViewController: UIViewController {
    
    let circle = UIView()
    
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
    }
    
    @IBAction func upButton(_ sender: UIButton) {
        moveUp(circle)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        moveLeft(circle)
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        moveRight(circle)
    }
    
    @IBAction func downButton(_ sender: UIButton) {
        moveDown(circle)
    }

    func moveUp(_ view: UIView) {
//        let circleCoordinate = circle.frame
//        print(circleCoordinate)
        let y = circle.frame.maxY - 60
        if y >= CGFloat(10.0) {
            view.center.y -= 10
        }
    }
    
    func moveLeft(_ view: UIView) {
        let x = circle.frame.maxX - 60
        if x >= CGFloat(10.0) {
            view.center.x -= 10
        }
    }
    
    func moveRight(_ view: UIView) {
        let x = circle.frame.maxX - 60
        if x <= CGFloat(315.0) {
            view.center.x += 10
        }
    }
    
    func moveDown(_ view: UIView) {
        let y = circle.frame.maxY - 60
        if y <= CGFloat(512.0) {
            view.center.y += 10
        }
    }
    
}
