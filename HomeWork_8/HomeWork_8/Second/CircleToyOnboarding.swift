//
//  CircleToyOnboarding.swift
//  HomeWork_8
//
//  Created by Nikita Pishchugin on 08.06.2022.
//

import UIKit

class CircleToyOnboardingViewController: UIViewController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    // MARK: - IBAction
    @IBAction func screenButton(_ sender: UIButton) {
        showCircleToyScreen()
    }
    
    // MARK: - Private Functions
    private func showCircleToyScreen() {
        let storyboard = UIStoryboard(name: "CircleToy", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CircleToyViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
