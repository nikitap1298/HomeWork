//
//  MainViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Public Properties
    let animal = Animal(name: "Leopard", maxAge: 17, speed: 58)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdditionalViewController" {
            let destinationVC = segue.destination as! AdditionalViewController
            destinationVC.animalName = animal.name
            destinationVC.animalMaxAge = animal.maxAge
            destinationVC.animalSpeed = animal.speed
        }
    }
    
    //MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showAnotherScreen()
    }
    
    //MARK: - Private Functions
    private func showAnotherScreen() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AdditionalViewController") as! AdditionalViewController
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        viewController.animalName = animal.name
        viewController.animalMaxAge = animal.maxAge
        viewController.animalSpeed = animal.speed
        present(viewController, animated: true)
    }
    
}
