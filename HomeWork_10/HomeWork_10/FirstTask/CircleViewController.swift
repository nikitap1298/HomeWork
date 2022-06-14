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
    
    // MARK: - Public Properties
    var circleTopAnchor: NSLayoutConstraint?
    var circleLeadingAnchor: NSLayoutConstraint?
    var circleTrailingAnchor: NSLayoutConstraint?
    var circleBottomAnchor: NSLayoutConstraint?
    
    var squareTopAnchor: NSLayoutConstraint?
    var squareLeadingAnchor: NSLayoutConstraint?
    var squareTrailingAnchor: NSLayoutConstraint?
    var squareBottomAnchor: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        view.addSubview(square)
        
        squareTopAnchor = square.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        squareLeadingAnchor = square.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        squareTrailingAnchor = square.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        squareBottomAnchor = square.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        
        squareTopAnchor?.isActive = true
        squareLeadingAnchor?.isActive = true
        squareTrailingAnchor?.isActive = true
        squareBottomAnchor?.isActive = true
    }


}

