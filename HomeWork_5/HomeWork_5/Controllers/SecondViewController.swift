//
//  SecondViewController.swift
//  HomeWork_5
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

// For iPhone 13 Pro
class SecondViewController: UIViewController {
    
    var n: Int = 0
    var x: Int = 0
    var y: Int = 0
    
    // User must to change only side value
    let side = 15
    let square = UIView()
    
    @IBOutlet weak var fillButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        square.frame = CGRect(x: 30, y: 30, width: side, height: side)
        square.backgroundColor = .red
        view.addSubview(square)
        
//        print("MaxX: \(view.frame.maxX); MaxY: \(view.frame.maxY)")
        // Makes fillButton above the squares
//        view.bringSubviewToFront(fillButtonLabel)
        
    }
    
    @IBAction func fullButton(_ sender: UIButton) {
        fill()
    }
    
    func fill() {
        let numberH = Int(view.frame.maxX / square.frame.width) + 1
        let numberV = Int(view.frame.maxY / square.frame.height) + 1
        let total = numberH * numberV
        
        if side >= 10 {
            for _ in 0...Int(Double(total)) {
                let minX = view.frame.minX
                let minY = view.frame.minY
                let square = UIView()
                square.frame = CGRect(x: minX + CGFloat(x * side), y: minY + CGFloat(y * side), width: CGFloat(side), height: CGFloat(side))
                square.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                view.addSubview(square)
                n += 1
                x += 1
                
                if n % numberH == 0 {
                    x = 0
                    y += 1
                }
//                print(square.frame.origin)
            }
        }
    }

}
