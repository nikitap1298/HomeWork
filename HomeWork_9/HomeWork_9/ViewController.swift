//
//  ViewController.swift
//  HomeWork_9
//
//  Created by Nikita Pishchugin on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private let squareHeight: CGFloat = 150
    
    // MARK: - IBOutlets
    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var yellowSquare: UIView!
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var orangeSquare: UIView!
    @IBOutlet var buttonsLabel: [UIButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in buttonsLabel {
            i.layer.cornerRadius = i.frame.height / 2
        }
        
        let panScreenGesture = UIPanGestureRecognizer()
        panScreenGesture.addTarget(self, action: #selector(didPanGesture(recognizer: )))
        view.addGestureRecognizer(panScreenGesture)
        
        let tapGestureSquare = UITapGestureRecognizer()
        tapGestureSquare.addTarget(self, action: #selector(didTapGesture(recognizer: )))
        greenSquare.addGestureRecognizer(tapGestureSquare)
    }

    // MARK: - Actions
    @objc private func didPanGesture(recognizer: UIPanGestureRecognizer) {
        let touchPointX = recognizer.location(in: self.view).x - 100
        let touchPointY = recognizer.location(in: self.view).y - 100
        greenSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY)
        yellowSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY)
        blueSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY + 110)
        orangeSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY + 110)
        
    }
    
    @objc private func didTapGesture(recognizer: UITapGestureRecognizer) {
        setSquareHeight()
    }
    
    @IBAction func reduceButton(_ sender: UIButton) {
        pressReduce()
    }
    
    @IBAction func hideButton(_ sender: UIButton) {
        hideSquares(true)
    }
    
    // MARK: - Private Functions
    private func setSquareHeight() {
        for constraint in self.greenSquare.constraints {
            if constraint.identifier == "greenSquareHeight" {
                constraint.constant = squareHeight
            }
        }
    }
    
    private func pressReduce() {
        greenSquare.frame.origin = CGPoint(x: 95, y: 322)
        yellowSquare.frame.origin = CGPoint(x: 205, y: 322)
        blueSquare.frame.origin = CGPoint(x: 95, y: 432)
        orangeSquare.frame.origin = CGPoint(x: 205, y: 432)
        hideSquares(false)
    }
    
    private func hideSquares(_ isHide: Bool) {
        greenSquare.isHidden = isHide
        yellowSquare.isHidden = isHide
        blueSquare.isHidden = isHide
        orangeSquare.isHidden = isHide
    }

}

