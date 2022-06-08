//
//  CircleOnboarding.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 08.06.2022.
//

import UIKit

class CircleOnboardingViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showCircleScreen()
    }
    
    // MARK: - Private Functions
    private func showCircleScreen() {
        let storyboard = UIStoryboard(name: "Circle", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CircleViewController")
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
