//
//  OnboardingViewController.swift
//  HomeWork_16
//
//  Created by Nikita Pishchugin on 14.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var libraryButtonLabel: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorYellow")
    }
    
    override func viewDidLayoutSubviews() {
        libraryButtonLabel.layer.cornerRadius = 30
    }
    
    // MARK: - IBAction
    @IBAction func libraryButton(_ sender: UIButton) {
        showPasswordAlert()
    }
    
    // MARK: - Private Functions
    private func showPasswordAlert() {
        let alert = UIAlertController(title: nil, message: "Enter the password", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.isSecureTextEntry = true
        let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
            let password = alert.textFields?.first
            
            if password?.text == "000" {
                let storyboard = UIStoryboard(name: "Library", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "LibraryViewController")
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
}
