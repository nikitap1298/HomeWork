//
//  HiddenWindowViewController.swift
//  HomeWork_14
//
//  Created by Nikita Pishchugin on 08.07.2022.
//

import UIKit

class HiddenWindowViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var flowerImage: UIImageView!
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(pressHomeButton))
    }
    
    // MARK: - Private Functions
    @objc private func pressHomeButton() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
