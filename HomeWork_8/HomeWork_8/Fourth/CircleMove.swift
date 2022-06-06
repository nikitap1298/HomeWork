//
//  CircleMove.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 07.06.2022.
//

import UIKit

class CircleMoveViewController: UIViewController {
    
    // MARK: - Private Properties
    private let circleToy = UIView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panScreenGesture = UIPanGestureRecognizer()
        panScreenGesture.addTarget(self, action: #selector(didPanGesture(recognizer: )))
        view.addGestureRecognizer(panScreenGesture)
        
        circleToy.frame.size = CGSize(width: 100, height: 100)
    }
    
    @objc private func didPanGesture(recognizer: UIPanGestureRecognizer) {
        let touchPointX = recognizer.location(in: self.view).x
        let touchPointY = recognizer.location(in: self.view).y
    
        circleToy.isHidden = false
        circleToy.backgroundColor = .red
        circleToy.frame = CGRect(x: touchPointX - circleToy.frame.height / 2, y: touchPointY - circleToy.frame.width / 2, width: circleToy.frame.width, height: circleToy.frame.height)
        circleToy.layer.cornerRadius = circleToy.frame.width / 2
        view.addSubview(circleToy)
    }
    
}
