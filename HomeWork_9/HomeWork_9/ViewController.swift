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
    private let defaultSquareHeight: CGFloat = 90
    
    // MARK: - IBOutlets
    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var yellowSquare: UIView!
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var orangeSquare: UIView!
    @IBOutlet var buttonsLabel: [UIButton]!
    @IBOutlet weak var greenSquareConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowSquareConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueSquareConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeSquareConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var greenX: NSLayoutConstraint!
    @IBOutlet weak var greenY: NSLayoutConstraint!
    @IBOutlet weak var yellowX: NSLayoutConstraint!
    @IBOutlet weak var yellowY: NSLayoutConstraint!
    @IBOutlet weak var blueX: NSLayoutConstraint!
    @IBOutlet weak var blueY: NSLayoutConstraint!
    @IBOutlet weak var orangeX: NSLayoutConstraint!
    @IBOutlet weak var orangeY: NSLayoutConstraint!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panScreenGesture = UIPanGestureRecognizer()
        panScreenGesture.addTarget(self, action: #selector(didPanGesture(recognizer: )))
        view.addGestureRecognizer(panScreenGesture)
        
        let tapGestureGreenSquare = UITapGestureRecognizer()
        tapGestureGreenSquare.addTarget(self, action: #selector(didTapGreen(recognizer: )))
        greenSquare.addGestureRecognizer(tapGestureGreenSquare)
        
        let tapGestureYellowSquare = UITapGestureRecognizer()
        tapGestureYellowSquare.addTarget(self, action: #selector(didTapYellow(recognizer: )))
        yellowSquare.addGestureRecognizer(tapGestureYellowSquare)
        
        let tapGestureBlueSquare = UITapGestureRecognizer()
        tapGestureBlueSquare.addTarget(self, action: #selector(didTapBlue(recognizer: )))
        blueSquare.addGestureRecognizer(tapGestureBlueSquare)
        
        let tapGestureOrangeSquare = UITapGestureRecognizer()
        tapGestureOrangeSquare.addTarget(self, action: #selector(didTapOrange(recognizer: )))
        orangeSquare.addGestureRecognizer(tapGestureOrangeSquare)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in buttonsLabel {
            i.layer.cornerRadius = i.frame.height / 2
        }
    }

    // MARK: - Actions
    @objc private func didPanGesture(recognizer: UIPanGestureRecognizer) {
        pressReduce()
        
        let touchPointX = recognizer.location(in: self.view).x - 100
        let touchPointY = recognizer.location(in: self.view).y - 100
        greenSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY)
        yellowSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY)
        blueSquare.frame.origin = CGPoint(x: touchPointX, y: touchPointY + 110)
        orangeSquare.frame.origin = CGPoint(x: touchPointX + 110, y: touchPointY + 110)
        
    }
    
    // TODO: Tap Green
    @objc private func didTapGreen(recognizer: UITapGestureRecognizer) {
        greenSquareConstraint.constant = squareHeight
        greenX.constant = -85
        greenY.constant = -85
    }
    
    // TODO: Tap Yellow
    @objc private func didTapYellow(recognizer: UITapGestureRecognizer) {
        yellowSquareConstraint.constant = squareHeight
        yellowX.constant = 85
        yellowY.constant = -85
    }
    
    // TODO: Tap Blue
    @objc private func didTapBlue(recognizer: UITapGestureRecognizer) {
        blueSquareConstraint.constant = squareHeight
        blueX.constant = -85
        blueY.constant = 85
    }
    
    // TODO: Tap Orange
    @objc private func didTapOrange(recognizer: UITapGestureRecognizer) {
        orangeSquareConstraint.constant = squareHeight
        orangeX.constant = 85
        orangeY.constant = 85
    }
    
    @IBAction func reduceButton(_ sender: UIButton) {
        pressReduce()
    }
    
    @IBAction func hideButton(_ sender: UIButton) {
        hideSquares(true)
    }
    
    // MARK: - Private Functions
    private func pressReduce() {
        greenX.constant = -55
        greenY.constant = -55
        greenSquareConstraint.constant = defaultSquareHeight
        yellowX.constant = 55
        yellowY.constant = -55
        yellowSquareConstraint.constant = defaultSquareHeight
        blueX.constant = -55
        blueY.constant = 55
        blueSquareConstraint.constant = defaultSquareHeight
        orangeX.constant = 55
        orangeY.constant = 55
        orangeSquareConstraint.constant = defaultSquareHeight
    
        hideSquares(false)
    }
    
    private func hideSquares(_ isHide: Bool) {
        greenSquare.isHidden = isHide
        yellowSquare.isHidden = isHide
        blueSquare.isHidden = isHide
        orangeSquare.isHidden = isHide
    }

}

