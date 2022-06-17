//
//  MainViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Public Properties
    let animal = Animal(name: "Leopard", maxAge: 17, speed: 58)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdditionalViewController" {
            guard let destinationVC = segue.destination as? AdditionalViewController else {
                return
            }
            destinationVC.animal = animal
        }
    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showAnotherScreen()
    }
    
    // MARK: - Private Functions
    private func showAnotherScreen() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "AdditionalViewController") as? AdditionalViewController else {
            return
        }
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.animal = animal
        present(viewController, animated: true)
    }
    
}
