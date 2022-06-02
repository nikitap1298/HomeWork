//
//  ThirdViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - Public Properties
    var greeting = ""
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FourthViewController" {
            let destinationVC = segue.destination as! FourthViewController
            destinationVC.greeting = greeting
        }
    }
    
    //MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showFourthVC()
    }
    
    //MARK: - Private Functions
    private func showFourthVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.greeting = greeting
        present(viewController, animated: true)
    }
}
