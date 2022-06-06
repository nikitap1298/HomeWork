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
        
        let pressGesture = UITapGestureRecognizer()
        pressGesture.addTarget(self, action: #selector(pressOnScreen(recognizer: )))
        view.addGestureRecognizer(pressGesture)
        
        circleToy.frame.size = CGSize(width: 100, height: 100)
    }
    
    @objc private func pressOnScreen(recognizer: UITapGestureRecognizer) {
        let touchPointX = recognizer.location(in: self.view).x
        let touchPointY = recognizer.location(in: self.view).y
    
        circleToy.backgroundColor = .red
        circleToy.frame = CGRect(x: touchPointX - circleToy.frame.height / 2, y: touchPointY - circleToy.frame.width / 2, width: circleToy.frame.width, height: circleToy.frame.height)
        circleToy.layer.cornerRadius = circleToy.frame.width / 2
        view.addSubview(circleToy)
    }
    
}
