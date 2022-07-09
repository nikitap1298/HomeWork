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
        menuView.translatesAutoresizingMaskIntoConstraints = false
        return menuView
    }()
    
    private var menuViewTopAnchor: NSLayoutConstraint?
    private var menuViewLeadingAnchor: NSLayoutConstraint?
    private var menuViewBottomAnchor: NSLayoutConstraint?
    private var menuViewWidthAnchor: NSLayoutConstraint?
    
    private var otherTasksButton: UIButton = {
        let otherTasksButton = UIButton()
        otherTasksButton.backgroundColor = .white
        otherTasksButton.setTitle("Other Tasks", for: .normal)
        otherTasksButton.setTitleColor(UIColor.gray, for: .normal)
        otherTasksButton.addShadow()
        otherTasksButton.translatesAutoresizingMaskIntoConstraints = false
        return otherTasksButton
    }()
    
    private var n: Int = 1
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorYellow")
        
        let leftButton = UIBarButtonItem(customView: burgerButton)
        navigationItem.leftBarButtonItem = leftButton
        
        setUpBurgerButton()
        setUpMenuView()
        setUpOtherTasksButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.layer.cornerRadius = 30
        menuView.addGradient(UIColor(named: "ColorLightGreen") ?? .white, UIColor(named: "ColorDarkGreen") ?? .white, .axial)
        menuView.bringSubviewToFront(otherTasksButton)
        otherTasksButton.layer.cornerRadius = 15
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        menuViewLeadingAnchor?.constant = -view.frame.width / 2.3
        view.removeBlur()
        n = 1
    }
    
    // MARK: - Private Functions
    private func setUpBurgerButton() {
        view.addSubview(burgerButton)
        
        burgerButton.addTarget(self, action: #selector(pressBurgerButton), for: .touchUpInside)
    }
    
    @objc private func pressBurgerButton() {
        n += 1
        
        if n % 2 == 0 {
            menuViewLeadingAnchor?.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.view.layoutIfNeeded()
            }
            
            // Add BlueEffect when Menu appears
            view.blurView(style: .dark)
            view.bringSubviewToFront(menuView)
        } else {
            menuViewLeadingAnchor?.constant = -view.frame.width / 2.3
            UIView.animate(withDuration: 0.5, delay: 0.0) {
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
    
    private func setUpOtherTasksButton() {
        menuView.addSubview(otherTasksButton)
        
        NSLayoutConstraint.activate([
            otherTasksButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 30),
            otherTasksButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 20),
            otherTasksButton.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -20),
            otherTasksButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        otherTasksButton.addTarget(self, action: #selector(showSecondTask), for: .touchUpInside)
    }
    
    @objc private func showSecondTask() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondTaskViewController")
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
