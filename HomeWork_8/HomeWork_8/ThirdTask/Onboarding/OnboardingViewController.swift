//
//  OnboardingViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    // MARK: - IBActions
    @IBAction func catGameButton(_ sender: UIButton) {
        showCatGame()
    }
    
    @IBAction func squaresButton(_ sender: UIButton) {
        showSquaresGame()
    }
    
    @IBAction func raceButton(_ sender: UIButton) {
        showRace()
    }
    
    // MARK: - Private Functions
    private func showCatGame() {
        let storyboard = UIStoryboard(name: "CatGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CatGameViewController")
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
    private func showSquaresGame() {
        let storyboard = UIStoryboard(name: "SquaresGame", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SquaresViewController")
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
    private func showRace() {
        let storyboard = UIStoryboard(name: "RaceMain", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RaceViewController")
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
}
