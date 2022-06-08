//
//  ViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 01.06.2022.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Public Properties
    var greeting = "Hello World"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    // MARK: - Action
    @IBAction func screenButton(_ sender: UIButton) {
        showSecondVC()
    }
    
    // MARK: - Private Functions
    private func showSecondVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        viewController.greeting = greeting
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

