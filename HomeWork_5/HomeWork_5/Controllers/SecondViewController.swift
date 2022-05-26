//
//  SecondViewController.swift
//  HomeWork_5
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

// For iPhone 13 Pro
class SecondViewController: UIViewController {
    
    let square0 = UIView()
    let square1 = UIView()
    let square2 = UIView()
    let square3 = UIView()
    let square4 = UIView()
    let square5 = UIView()
    let square6 = UIView()
    let square7 = UIView()
    
    @IBOutlet weak var fillButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let minX = view.frame.minX
        let minY = view.frame.minY
        let maxX = view.frame.maxX
        let maxY = view.frame.maxY
        
//        print("Max x: \(maxX): Max y: \(maxY)")
        
        square0.frame = CGRect(x: minX, y: minY, width: maxX / 2, height: maxY / 4)
        square0.backgroundColor = .clear
        view.addSubview(square0)
        
        square1.frame = CGRect(x: maxX / 2, y: minY, width: maxX / 2, height: maxY / 4)
        square1.backgroundColor = .clear
        view.addSubview(square1)
        
        square2.frame = CGRect(x: minX, y: maxY / 4, width: maxX / 2, height: maxY / 4)
        square2.backgroundColor = .clear
        view.addSubview(square2)
        
        square3.frame = CGRect(x: maxX / 2, y: maxY / 4, width: maxX / 2, height: maxY / 4)
        square3.backgroundColor = .clear
        view.addSubview(square3)
        
        square4.frame = CGRect(x: minX, y: maxY / 2, width: maxX / 2, height: maxY / 4)
        square4.backgroundColor = .clear
        view.addSubview(square4)
        
        square5.frame = CGRect(x: maxX / 2, y: maxY / 2, width: maxX / 2, height: maxY / 4)
        square5.backgroundColor = .clear
        view.addSubview(square5)
        
        square6.frame = CGRect(x: minX, y: (maxY / 4) * 3, width: maxX / 2, height: maxY / 4)
        square6.backgroundColor = .clear
        view.addSubview(square6)
        
        square7.frame = CGRect(x: maxX / 2, y: (maxY / 4) * 3, width: maxX / 2, height: maxY / 4)
        square7.backgroundColor = .clear
        view.addSubview(square7)
        
        // Makes fillButton above the squares
        view.bringSubviewToFront(fillButtonLabel)
        
    }
    
    @IBAction func fillButton(_ sender: UIButton) {
        randomColor()
    }
    
    func randomColor() {
        square0.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square1.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square2.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square3.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square4.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square5.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square6.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        square7.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
    
}
