//
//  SecondViewController.swift
//  HomeWork_6
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

// For iPhone 13 Pro
class SecondViewController: UIViewController {
    
    //MARK: - Private Properties
    private var n: Int = 0
    private var x: Int = 0
    private var y: Int = 0
    
    // User must to change only side value
    let side = 100
    let square = UIView()
    
    //MARK: - IBOutlets
    @IBOutlet weak var fillButtonLabel: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        square.frame = CGRect(x: 50, y: 50, width: side, height: side)
        square.backgroundColor = .red
        view.addSubview(square)
        
    }
    
    //MARK: - IBAction
    @IBAction func fillButton(_ sender: UIButton) {
        fill()
    }
    
    //MARK: - Private Functions
    private func fill() {
        let numberH = Int(view.frame.maxX / square.frame.width) + 1
        let numberV = Int(view.frame.maxY / square.frame.height) + 1
        let total = numberH * numberV
        
        if side >= 50 {
            for _ in 0...total {
                let square = UIView()
                let label = UILabel(frame: CGRect(x: CGFloat(side / 2 ) - 20, y: CGFloat(side / 2 ) - 20, width: 40, height: 40))
                label.backgroundColor = .white
                label.textAlignment = .center
                square.addSubview(label)
                
                square.frame = CGRect(x: CGFloat(x * side), y: CGFloat(y * side), width: CGFloat(side), height: CGFloat(side))
                square.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
                view.addSubview(square)
                
                // Только так наверное можно цвет в Label передать. У нас же цвета у квадратов не .red; .green и тд, а такие например: UIExtendedSRGBColorSpace 0.232777 0.74647 0.518613 1. Это же может быть оттенок какого-то цвета.
                label.text = "\(square.backgroundColor!))"
                n += 1
                x += 1
                
                if n % numberH == 0 {
                    x = 0
                    y += 1
                }
            }
        }
    }
    
}
