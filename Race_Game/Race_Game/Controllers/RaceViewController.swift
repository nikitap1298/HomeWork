//
//  RaceViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class RaceViewController: UIViewController {
    
    // MARK: - Private Properties
    private var road: UIView = {
        let road = UIView()
        road.backgroundColor = UIColor(named: "colorRoad")
        road.translatesAutoresizingMaskIntoConstraints = false
        return road
    }()
    
    private  var leftButton: UIButton = {
        let leftButton = UIButton()
        leftButton.backgroundColor = UIColor(named: "colorYellow")
        leftButton.setTitle("<-", for: .normal)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        return leftButton
    }()
    
    private  var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.backgroundColor = UIColor(named: "colorYellow")
        rightButton.setTitle("->", for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        return rightButton
    }()
    
    private var whiteLine: UIView = {
        let whiteLine = UIView()
        whiteLine.backgroundColor = .white
        whiteLine.translatesAutoresizingMaskIntoConstraints = false
        return whiteLine
    }()
    
    private var car: UIImageView = {
        let car = UIImageView()
        car.image = UIImage(named: "car")
        car.translatesAutoresizingMaskIntoConstraints = false
        return car
    }()
    
    // MARK: - Public Properties
    var carCenterX: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRoad()
        setupLeftButton()
        setupRightButton()
        setupWhiteLine()
        setupCar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        leftButton.layer.cornerRadius = leftButton.frame.height / 2
        rightButton.layer.cornerRadius = rightButton.frame.height / 2
    }
    
    // MARK: - Actions
    @objc private func tapLeftButton() {
        guard let carCenterX = carCenterX else {
            return
        }
        carCenterX.constant -= 25
        if carCenterX.constant <= -70 {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc private func tapRightButton() {
        guard let carCenterX = carCenterX else {
            return
        }
        carCenterX.constant += 25
        if carCenterX.constant >= 70 {
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    // MARK: - Private Functions
    
    // road constraints
    private func setupRoad() {
        view.addSubview(road)
        
        NSLayoutConstraint.activate([
            road.topAnchor.constraint(equalTo: view.topAnchor),
            road.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            road.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            road.widthAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    // leftButton constraints
    private func setupLeftButton() {
        view.addSubview(leftButton)
        
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            leftButton.trailingAnchor.constraint(equalTo: road.leadingAnchor, constant: -15),
            leftButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            leftButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        leftButton.addTarget(self, action: #selector(tapLeftButton), for: .touchUpInside)
    }
    
    // rightButton constraints
    private func setupRightButton() {
        view.addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            rightButton.leadingAnchor.constraint(equalTo: road.trailingAnchor, constant: 15),
            rightButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            rightButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        rightButton.addTarget(self, action: #selector(tapRightButton), for: .touchUpInside)
    }
    
    // whiteLine constraints
    private func setupWhiteLine() {
        road.addSubview(whiteLine)
        
        NSLayoutConstraint.activate([
            whiteLine.centerXAnchor.constraint(equalTo: road.centerXAnchor),
            whiteLine.topAnchor.constraint(equalTo: road.topAnchor, constant: 0),
            whiteLine.bottomAnchor.constraint(equalTo: road.bottomAnchor, constant: 0),
            whiteLine.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setupCar() {
        view.addSubview(car)
        
        carCenterX = car.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([
            car.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            car.widthAnchor.constraint(equalToConstant: 60),
            car.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        guard let carCenterX = carCenterX else {
            return
        }
        carCenterX.isActive = true
    }
    
}
