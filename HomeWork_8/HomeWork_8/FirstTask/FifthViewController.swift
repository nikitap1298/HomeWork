//
//  FifthViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class FifthViewController: UIViewController {
    
    // MARK: - Public Properties
    var greeting = ""
    
    // MARK: - IBOutlet
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        textLabel.text = greeting
        
        let leftButton = UIButton()
        leftButton.setTitle("Fourth Screen", for: .normal)
        leftButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        let leftButtonItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftButtonItem
    }
    
    @objc private func tapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    @IBAction func showFirstVC(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
