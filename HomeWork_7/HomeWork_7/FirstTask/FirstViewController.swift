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
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SecondViewController" {
//            let destinationVC = segue.destination as! SecondViewController
//            destinationVC.greeting = greeting
//        }
//    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showSecondVC()
    }
    
    // MARK: - Private Functions
    private func showSecondVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.greeting = greeting
        present(viewController, animated: true)
        
    }
    
}

