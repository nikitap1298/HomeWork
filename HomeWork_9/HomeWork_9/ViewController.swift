//
//  ViewController.swift
//  HomeWork_9
//
//  Created by Nikita Pishchugin on 09.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var yellowSquare: UIView!
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var orangeSquare: UIView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panScreenGesture = UIPanGestureRecognizer()
        panScreenGesture.addTarget(self, action: #selector(didPanGesture(recognizer: )))
        view.addGestureRecognizer(panScreenGesture)
        
        let tapSquareGesture = UITapGestureRecognizer()
        tapSquareGesture.addTarget(self, action: #selector(didTapGesture(recognizer: )))
        greenSquare.addGestureRecognizer(tapSquareGesture)
    }

    // MARK: - Actions
    @objc private func didPanGesture(recognizer: UIPanGestureRecognizer) {
        let touchPointX = recognizer.location(in: self.view).x - view.frame.midX
        let touchPointY = recognizer.location(in: self.view).y - view.frame.midY
        greenSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY)
        yellowSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY)
        blueSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY + 110)
        orangeSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY + 110)
        
    }
    
    @objc private func didTapGesture(recognizer: UITapGestureRecognizer) {
        greenSquare.frame.size = CGSize(width: 50, height: 50)
    }
    
    @IBAction func reduceButton(_ sender: UIButton) {
        greenSquare.frame.origin = CGPoint(x: 0, y: 0)
        yellowSquare.frame.origin = CGPoint(x: 110, y: 0)
        blueSquare.frame.origin = CGPoint(x: 0, y: 110)
        orangeSquare.frame.origin = CGPoint(x: 110, y: 110)
    }
    
    
    @IBAction func hideButton(_ sender: UIButton) {
        greenSquare.isHidden = true
        yellowSquare.isHidden = true
        blueSquare.isHidden = true
        orangeSquare.isHidden = true
        
    }
    

}

