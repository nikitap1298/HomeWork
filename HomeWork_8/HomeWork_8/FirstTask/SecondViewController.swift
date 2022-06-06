//
//  SecondViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Public Properties
    var greeting = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        let leftButton = UIButton()
        leftButton.setTitle("First Screen", for: .normal)
        leftButton.tintColor = .white
        leftButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        let leftButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    @objc private func tapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showThirdVC()
    }
    
    // MARK: - Private Functions
    private func showThirdVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.greeting = greeting
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
