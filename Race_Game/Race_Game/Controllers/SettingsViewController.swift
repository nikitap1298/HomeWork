//
//  SettingsViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var buttonsLabel: [UIButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "colorYellow")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for i in buttonsLabel {
            i.layer.cornerRadius = 30
        }
    }
    
    
    // MARK: - IBActions
    @IBAction func carColorButton(_ sender: UIButton) {
        colorAlert()
    }
    @IBAction func barrierButton(_ sender: UIButton) {
        barrierAlert()
    }
    @IBAction func nameButton(_ sender: UIButton) {
        nameAlert()
    }
    @IBAction func speedButton(_ sender: UIButton) {
        speedAlert()
    }
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
    
    // MARK: - Private Functions
    private func colorAlert() {
        let alert = UIAlertController(title: nil, message: "Choose car color", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Default", style: .default) { action in
            UserDefaults.standard.set("Yellow", forKey: "CarColor")
        }
        let secondAction = UIAlertAction(title: "Red", style: .default) { action in
            UserDefaults.standard.set("Red", forKey: "CarColor")
//            let redColor = UserDefaults.standard.value(forKey: "CarRedColor") as? String
//            if redColor == "Red" {
//                AllSettings.singleton.carColor = .systemRed
//            }
            
        }
        let thirdAction = UIAlertAction(title: "Blue", style: .default) { action in
            UserDefaults.standard.set("Blue", forKey: "CarColor")
        }
        let fourthAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        alert.addAction(fourthAction)
        present(alert, animated: true)
    }
    
    private func barrierAlert() {
        let alert = UIAlertController(title: nil, message: "Choose barrier", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Default", style: .default) { action in
            UserDefaults.standard.set("Grass", forKey: "BarrierImage")
        }
        let secondAction = UIAlertAction(title: "Barrier", style: .default) { action in
            UserDefaults.standard.set("Barrier", forKey: "BarrierImage")
        }
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }
    
    private func nameAlert() {
        let alert = UIAlertController(title: nil, message: "Enter your name", preferredStyle: .alert)
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Done", style: .default) { _ in
//            let name = alert.textFields?.first
            
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    private func speedAlert() {
        let alert = UIAlertController(title: nil, message: "Choose speed", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Default", style: .default) { action in
            UserDefaults.standard.set(2.5, forKey: "Speed")
        }
        let secondAction = UIAlertAction(title: "Slower", style: .default) { action in
            UserDefaults.standard.set(3.5, forKey: "Speed")
        }
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }
    
}

