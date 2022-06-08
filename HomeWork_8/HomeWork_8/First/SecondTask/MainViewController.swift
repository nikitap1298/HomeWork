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
            let destinationVC = segue.destination as! AdditionalViewController
            destinationVC.animal = animal
        }
    }
    
    // MARK: - Action
    @IBAction func screenButton(_ sender: UIButton) {
        showAnotherScreen()
    }
    
    // MARK: - Private Functions
    private func showAnotherScreen() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AdditionalViewController") as! AdditionalViewController
        viewController.animal = animal
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
