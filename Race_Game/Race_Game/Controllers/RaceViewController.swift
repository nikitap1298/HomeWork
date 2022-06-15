//
//  RaceViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class RaceViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRoad()
        setupLeftButton()
        setupRightButton()
        setupWhiteLine()
        setupCar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        UI.leftButton.layer.cornerRadius = UI.leftButton.frame.height / 2
        UI.rightButton.layer.cornerRadius = UI.rightButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func tapLeftButton() {
        UI.carCenterX?.constant -= 25
    }
    
    @objc private func tapRightButton() {
        UI.carCenterX?.constant += 25
    }
    
    // MARK: - Private Functions
    
    // road constraints
    private func setupRoad() {
        view.addSubview(UI.road)
        
        NSLayoutConstraint.activate([
            UI.road.topAnchor.constraint(equalTo: view.topAnchor),
            UI.road.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            UI.road.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            UI.road.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    // leftButton constraints
    private func setupLeftButton() {
        view.addSubview(UI.leftButton)
        
        NSLayoutConstraint.activate([
            UI.leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            UI.leftButton.trailingAnchor.constraint(equalTo: UI.road.leadingAnchor, constant: -15),
            UI.leftButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            UI.leftButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        UI.leftButton.addTarget(self, action: #selector(tapLeftButton), for: .touchUpInside)
    }
    
    // rightButton constraints
    private func setupRightButton() {
        view.addSubview(UI.rightButton)
        
        NSLayoutConstraint.activate([
            UI.rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            UI.rightButton.leadingAnchor.constraint(equalTo: UI.road.trailingAnchor, constant: 15),
            UI.rightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            UI.rightButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        UI.rightButton.addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
    }
    
    // whiteLine constraints
    private func setupWhiteLine() {
        UI.road.addSubview(UI.whiteLine)
        
        NSLayoutConstraint.activate([
            UI.whiteLine.centerXAnchor.constraint(equalTo: UI.road.centerXAnchor),
            UI.whiteLine.topAnchor.constraint(equalTo: UI.road.topAnchor, constant: 0),
            UI.whiteLine.bottomAnchor.constraint(equalTo: UI.road.bottomAnchor, constant: 0),
            UI.whiteLine.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setupCar() {
        view.addSubview(UI.car)
        
        UI.carCenterX = UI.car.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([
            UI.car.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            UI.car.widthAnchor.constraint(equalToConstant: 60),
            UI.car.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        UI.carCenterX?.isActive = true
    }
    
}
