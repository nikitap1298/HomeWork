//
//  ViewController.swift
//  HomeWork_14
//
//  Created by Nikita Pishchugin on 07.07.2022.
//

import UIKit

class FirstTaskViewController: UIViewController {
    
    // MARK: - Private Properties
    private var burgerIsPressing: Bool = false
    
    private var burgerButton: UIButton = {
        let burgerButton = UIButton()
        burgerButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        burgerButton.tintColor = .white
        burgerButton.translatesAutoresizingMaskIntoConstraints = false
        return burgerButton
    }()
    
    private var burgerTopAnchor: NSLayoutConstraint?
    private var burgerLeadingAnchor: NSLayoutConstraint?
    private var burgerWidthAnchor: NSLayoutConstraint?
    private var burgerHeigtAnchor: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorYellow")
        
        setUpBurgerButton()
    }
    
    // MARK: - Private Functions
    private func setUpBurgerButton() {
        view.addSubview(burgerButton)
        
        burgerTopAnchor = burgerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        burgerLeadingAnchor = burgerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        burgerWidthAnchor = burgerButton.widthAnchor.constraint(equalToConstant: 40)
        burgerHeigtAnchor = burgerButton.heightAnchor.constraint(equalToConstant: 40)
        
        guard let burgerTopAnchor = burgerTopAnchor,
              let burgerLeadingAnchor = burgerLeadingAnchor,
              let burgerWidthAnchor = burgerWidthAnchor,
              let burgerHeigtAnchor = burgerHeigtAnchor else { return }
        
        burgerTopAnchor.isActive = true
        burgerLeadingAnchor.isActive = true
        burgerWidthAnchor.isActive = true
        burgerHeigtAnchor.isActive = true
        
        burgerButton.addTarget(self, action: #selector(pressBurgerButton), for: .touchUpInside)
    }
    
    @objc private func pressBurgerButton() {
        burgerLeadingAnchor?.constant = 100
    }
    
}

