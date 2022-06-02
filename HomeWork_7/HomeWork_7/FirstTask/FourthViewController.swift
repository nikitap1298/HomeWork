//
//  FourthViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class FourthViewController: UIViewController {
    
    //MARK: - Public Properties
    var greeting = ""
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FifthViewController" {
            let destinationVC = segue.destination as! FifthViewController
            destinationVC.greeting = greeting
        }
    }
    
    //MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showFifthVC()
    }
    
    //MARK: - Private Functions
    private func showFifthVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.greeting = greeting
        present(viewController, animated: true)
    }
    
}
