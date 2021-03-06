//
//  ThirdViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: - Public Properties
    var greeting = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        let leftButton = UIButton()
        leftButton.setTitle("Second Screen", for: .normal)
        leftButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        let leftButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    // MARK: - Action
    @objc private func tapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func screenButton(_ sender: UIButton) {
        showFourthVC()
    }
    
    // MARK: - Private Functions
    private func showFourthVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController else {
            return
        }
        viewController.greeting = greeting
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
