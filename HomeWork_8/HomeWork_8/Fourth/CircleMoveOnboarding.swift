//
//  CircleMoveOnboarding.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 08.06.2022.
//

import UIKit

class CircleMoveOnboardingViewController: UIViewController {
    
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
        let storyboard = UIStoryboard(name: "CircleMove", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CircleMoveViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
