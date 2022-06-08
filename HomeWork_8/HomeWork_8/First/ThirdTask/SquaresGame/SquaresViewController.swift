//
//  SquaresViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class SquaresViewController: UIViewController {
    
    // MARK: - Private Properties
    private var n: Int = 0
    private var x: Int = 0
    private var y: Int = 0
    
    // User must to change only side value
    private let side = 15
    private let square = UIView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        square.frame = CGRect(x: 30, y: 30, width: side, height: side)
        square.backgroundColor = .red
        view.addSubview(square)
        
    }
    
    // MARK: - Action
    @objc private func didTapBackButton() {
        dismiss(animated: true)
    }

    @IBAction func fillButton(_ sender: UIButton) {
        fill()
    }
    
    // MARK: - Private Functions
    private func fill() {
        let numberH = Int(view.frame.maxX / square.frame.width) + 1
        let numberV = Int(view.frame.maxY / square.frame.height) + 1
        let total = numberH * numberV
        if side >= 10 {
            for _ in 0...total {
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
            }
        }
    }
    
}
