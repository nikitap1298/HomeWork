//
//  ViewController.swift
//  HomeWork_5
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let catToy = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        catToy.backgroundColor = .red
        catToy.frame = CGRect(x: xCenter - 100 / 2, y: yCenter - 100 / 2, width: 100, height: 100)
        catToy.layer.cornerRadius = 50
        view.addSubview(catToy)
        
        catToy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
    }
    
    @objc func didTap() {
        randomPlace()
        randomColor()
    }
    
    func randomPlace() {
        self.catToy.frame = CGRect(x: .random(in: 0..<view.frame.maxX - 100), y: .random(in: 0..<view.frame.maxY - 100), width: 100, height: 100)
    }
    
    func randomColor() {
        let redR = CGFloat.random(in: 0...1)
        let greenR = CGFloat.random(in: 0...1)
        let blueR = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: redR, green: greenR, blue: blueR, alpha: 1)
        
        catToy.backgroundColor = randomColor
    }
    
}

