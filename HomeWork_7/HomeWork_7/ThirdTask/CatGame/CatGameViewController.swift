//
//  CatGameViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class CatGameViewController: UIViewController {
    
    //MARK: - Private Properties
    private let catToy = UIView()
    private lazy var backButton = makeBackButton()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catToy.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let xCenter = view.frame.midX
        let yCenter = view.frame.midY
        
        catToy.backgroundColor = .red
        catToy.frame = CGRect(x: xCenter - catToy.frame.width / 2, y: yCenter - catToy.frame.height / 2, width: catToy.frame.width, height: catToy.frame.height)
        catToy.layer.cornerRadius = catToy.frame.width / 2
        view.addSubview(catToy)
        
        catToy.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
    }
    
    @objc private func didTap() {
        randomPlace()
        randomColor()
    }
    
    @objc private func didTapBackButton() {
        dismiss(animated: true)
    }
    
    //MARK: - Private Functions
    private func randomPlace() {
        self.catToy.frame = CGRect(x: .random(in: 0..<view.frame.maxX - catToy.frame.width), y: .random(in: 0..<view.frame.maxY - catToy.frame.height - 40), width: catToy.frame.width, height: catToy.frame.width)
    }
    
    private func randomColor() {
        let redR = CGFloat.random(in: 0...1)
        let greenR = CGFloat.random(in: 0...1)
        let blueR = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: redR, green: greenR, blue: blueR, alpha: 1)
        
        catToy.backgroundColor = randomColor
    }
    
    private func makeBackButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Onboarding", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
}
