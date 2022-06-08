//
//  CircleToy.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 06.06.2022.
//

import UIKit

class CircleToyViewController: UIViewController {
    
    // MARK: - Private Properties
    private let circleToy = UIView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pressScreenGesture = UITapGestureRecognizer()
        pressScreenGesture.addTarget(self, action: #selector(pressOnScreen(recognizer: )))
        view.addGestureRecognizer(pressScreenGesture)
        
        let pressToyGesture = UITapGestureRecognizer()
        pressToyGesture.addTarget(self, action: #selector(pressOnToy(recogrinzer: )))
        circleToy.addGestureRecognizer(pressToyGesture)
        circleToy.frame.size = CGSize(width: 100, height: 100)
    }
    
    // MARK: - Action
    @objc private func pressOnScreen(recognizer: UITapGestureRecognizer) {
        let touchPointX = recognizer.location(in: self.view).x
        let touchPointY = recognizer.location(in: self.view).y
        circleToy.isHidden = false
        circleToy.backgroundColor = .red
        circleToy.frame = CGRect(x: touchPointX - circleToy.frame.height / 2, y: touchPointY - circleToy.frame.width / 2, width: circleToy.frame.width, height: circleToy.frame.height)
        circleToy.layer.cornerRadius = circleToy.frame.width / 2
        view.addSubview(circleToy)
    }
    
    @objc private func pressOnToy(recogrinzer: UITapGestureRecognizer) {
        circleToy.isHidden = true
    }
    
}
