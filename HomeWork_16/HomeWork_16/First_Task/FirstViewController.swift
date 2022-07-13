//
//  ViewController.swift
//  HomeWork_16
//
//  Created by Nikita Pishchugin on 14.07.2022.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var customView: CustomView!
    
    // MARK: - Life Cecle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButton()
    }

    // MARK: - Private Functions
    private func setUpButton() {
        customView.button.setTitle("Press", for: .normal)
        customView.button.addTarget(self, action: #selector(alert), for: .touchUpInside)
    }
    
    @objc private func alert() {
        let alert = UIAlertController(title: nil, message: "Choose your age", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "0-17", style: .default) { alert in
            print(alert.title ?? "Data not found")
        }
        let secondAction = UIAlertAction(title: "18+", style: .default) { alert in
            print(alert.title ?? "Data not found")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}

