//
//  RaceViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class RaceViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var backButton = makeBackButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            backButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
    @objc private func didTapBackButton() {
        dismiss(animated: true)
    }
    
    // MARK: - Private Functions
    private func makeBackButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Onboarding", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
