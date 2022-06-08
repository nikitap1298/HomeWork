//
//  FourthViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class FourthViewController: UIViewController {
    
    // MARK: - Public Properties
    var greeting = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        
        let leftButton = UIButton()
        leftButton.setTitle("ThirdScreen", for: .normal)
        leftButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        let leftButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    @objc private func tapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showFifthVC()
    }
    
    // MARK: - Private Functions
    private func showFifthVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        viewController.greeting = greeting
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
