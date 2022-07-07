//
//  ViewController.swift
//  HomeWork_14
//
//  Created by Nikita Pishchugin on 07.07.2022.
//

import UIKit

class FirstTaskViewController: UIViewController {
    
    // MARK: - Private Properties
    private var burgerButton: UIButton = {
        let burgerButton = UIButton()
        burgerButton.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        burgerButton.tintColor = .white
        burgerButton.translatesAutoresizingMaskIntoConstraints = false
        return burgerButton
    }()
    
    private var menuView: UIView = {
        let menuView = UIView()
        menuView.backgroundColor = .gray
        menuView.translatesAutoresizingMaskIntoConstraints = false
        return menuView
    }()
    
    private var menuViewTopAnchor: NSLayoutConstraint?
    private var menuViewLeadingAnchor: NSLayoutConstraint?
    private var menuViewBottomAnchor: NSLayoutConstraint?
    private var menuViewWidthAnchor: NSLayoutConstraint?
    
    private var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = .white
        secondButton.setTitle("Second Task", for: .normal)
        secondButton.setTitleColor(UIColor.black, for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        return secondButton
    }()
    
    private var thirdButton: UIButton = {
        let thirdButton = UIButton()
        thirdButton.backgroundColor = .white
        thirdButton.setTitle("Third Task", for: .normal)
        thirdButton.setTitleColor(UIColor.black, for: .normal)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        return thirdButton
    }()
    
    private var n: Int = 1
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorYellow")
        
        let backButton = UIBarButtonItem(customView: burgerButton)
        navigationItem.leftBarButtonItem = backButton
        
        setUpBurgerButton()
        setUpMenuView()
        setUpSecondButton()
        setUpThirdButton()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.layer.cornerRadius = 30
        menuView.layer.maskedCorners = [.layerMaxXMinYCorner]
        secondButton.layer.cornerRadius = 15
        thirdButton.layer.cornerRadius = 15
    }
    
    // MARK: - Private Functions
    private func setUpBurgerButton() {
        view.addSubview(burgerButton)
        
        NSLayoutConstraint.activate([
            burgerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            burgerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        burgerButton.addTarget(self, action: #selector(pressBurgerButton), for: .touchUpInside)
    }
    
    @objc private func pressBurgerButton() {
        n += 1
        
        if n % 2 == 0 {
            menuViewLeadingAnchor?.constant = 0
            UIView.animate(withDuration: 1.0, delay: 0.0) {
                self.view.layoutIfNeeded()
            }
            
            // Add BlueEffect when Menu appears
            view.blurView(style: .dark)
            view.bringSubviewToFront(menuView)
        } else {
            menuViewLeadingAnchor?.constant = -view.frame.width / 2.3
            UIView.animate(withDuration: 1.0, delay: 0.0) {
                self.view.layoutIfNeeded()
            }
            view.removeBlur()
        }
        
    }
    
    private func setUpMenuView() {
        view.addSubview(menuView)
        
        menuViewTopAnchor = menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        menuViewBottomAnchor = menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        menuViewWidthAnchor = menuView.widthAnchor.constraint(equalToConstant: view.frame.width / 2.3)
        menuViewLeadingAnchor = menuView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -view.frame.width / 2.3)
        
        guard let menuViewTopAnchor = menuViewTopAnchor,
              let menuViewBottomAnchor = menuViewBottomAnchor,
              let menuViewLeadingAnchor = menuViewLeadingAnchor,
              let menuViewWidthAnchor = menuViewWidthAnchor else { return }
        
        menuViewTopAnchor.isActive = true
        menuViewBottomAnchor.isActive = true
        menuViewWidthAnchor.isActive = true
        menuViewLeadingAnchor.isActive = true
    }
    
    private func setUpSecondButton() {
        menuView.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 30),
            secondButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 20),
            secondButton.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -20),
            secondButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        secondButton.addTarget(self, action: #selector(showSecondTask), for: .touchUpInside)
    }
    
    @objc private func showSecondTask() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondTaskViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setUpThirdButton() {
        menuView.addSubview(thirdButton)
        
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 30),
            thirdButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 20),
            thirdButton.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -20),
            thirdButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        thirdButton.addTarget(self, action: #selector(showThirdTask), for: .touchUpInside)
    }
    
    @objc private func showThirdTask() {
        let storyboard = UIStoryboard(name: "Third", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdTaskViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - Extension (add and remove blur)
extension UIView {
  func blurView(style: UIBlurEffect.Style) {
    var blurEffectView = UIVisualEffectView()
    let blurEffect = UIBlurEffect(style: style)
    blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = bounds
    addSubview(blurEffectView)
  }
  
  func removeBlur() {
    for view in self.subviews {
      if let view = view as? UIVisualEffectView {
        view.removeFromSuperview()
      }
    }
  }
    
}
