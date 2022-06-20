//
//  ViewController.swift
//  HomeWork_10
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class CircleViewController: UIViewController {
    
    // MARK: - Private Properties
    private var circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .red
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    private var square: UIView = {
        let square = UIView()
        square.backgroundColor = UIColor(named: "colorBlue")
        square.translatesAutoresizingMaskIntoConstraints = false
        return square
    }()
    
    private var squareTopAnchor: NSLayoutConstraint?
    private var squareLeadingAnchor: NSLayoutConstraint?
    private var squareTrailingAnchor: NSLayoutConstraint?
    private var squareBottomAnchor: NSLayoutConstraint?
    
    private var circleTopAnchor: NSLayoutConstraint?
    private var circleLeadingAnchor: NSLayoutConstraint?
    private var circleTrailingAnchor: NSLayoutConstraint?
    private var circleBottomAnchor: NSLayoutConstraint?
    private var circleWidth: NSLayoutConstraint?
    private var circleHeight: NSLayoutConstraint?
    
    private var isTop: Bool = true
    private var isLeading: Bool = true
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSquare()
        setupCircle()
        createHorizontalTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        circle.layer.cornerRadius = circle.frame.height / 2
    }
    
    // MARK: - Private Functions
    
    // Square Constraints
    private func setupSquare() {
        view.addSubview(square)
        
        squareTopAnchor = square.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        squareLeadingAnchor = square.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        squareTrailingAnchor = square.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        squareBottomAnchor = square.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        
        guard let squareTopAnchor = squareTopAnchor,
              let squareLeadingAnchor = squareLeadingAnchor,
              let squareTrailingAnchor = squareTrailingAnchor,
              let squareBottomAnchor = squareBottomAnchor
        else {
            return
        }
        
        // It's not optional because we are using guard let above
        squareTopAnchor.isActive = true
        squareLeadingAnchor.isActive = true
        squareTrailingAnchor.isActive = true
        squareBottomAnchor.isActive = true
    }
    
    // Circle Constraints
    private func setupCircle() {
        square.addSubview(circle)
        
        circleTopAnchor = circle.topAnchor.constraint(equalTo: square.topAnchor, constant: 5)
        circleLeadingAnchor = circle.leadingAnchor.constraint(equalTo: square.leadingAnchor, constant: 5)
        circleTrailingAnchor = circle.trailingAnchor.constraint(equalTo: square.trailingAnchor, constant: -5)
        circleBottomAnchor = circle.bottomAnchor.constraint(equalTo: square.bottomAnchor, constant: -5)
        circleWidth = circle.widthAnchor.constraint(equalToConstant: 30)
        circleHeight = circle.heightAnchor.constraint(equalToConstant: 30)
        
        guard let circleTopAnchor = circleTopAnchor,
              let circleLeadingAnchor = circleLeadingAnchor,
              let circleWidth = circleWidth,
              let circleHeight = circleHeight else {
            return
        }
        
        // It's not optional because we are using guard let above
        circleTopAnchor.isActive = true
        circleLeadingAnchor.isActive = true
        circleWidth.isActive = true
        circleHeight.isActive = true
    }
    
    private func createVerticalTimer() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
            guard let self = self else {
                return
            }
            if self.isTop {
                self.animateBottom()
            } else {
                self.animateTop()
            }
        }
    }
    
    private func createHorizontalTimer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] timer in
            guard let self = self else {
                return
            }
            if self.isLeading {
                self.animateTrailing()
                self.createVerticalTimer()
            } else {
                self.animateLeading()
            }
        }
    }
    
    private func animateTop() {
        circleTopAnchor?.isActive = true
        circleBottomAnchor?.isActive = false
        UIView.animate(withDuration: 2.0) {
            self.square.layoutIfNeeded()
        } completion: { _ in
            self.isTop = true
        }
    }
    
    private func animateLeading() {
        circleLeadingAnchor?.isActive = true
        circleTrailingAnchor?.isActive = false
        UIView.animate(withDuration: 3.0) {
            self.square.layoutIfNeeded()
        } completion: { _ in
            self.isLeading = true
        }
    }
    
    private func animateTrailing() {
        circleLeadingAnchor?.isActive = false
        circleTrailingAnchor?.isActive = true
        UIView.animate(withDuration: 3.0) {
            self.square.layoutIfNeeded()
        } completion: { _ in
            self.isLeading = false
        }
    }
    
    private func animateBottom() {
        circleTopAnchor?.isActive = false
        circleBottomAnchor?.isActive = true
        UIView.animate(withDuration: 2.0) {
            self.square.layoutIfNeeded()
        } completion: { _ in
            self.isTop = false
        }
    }
    
}

