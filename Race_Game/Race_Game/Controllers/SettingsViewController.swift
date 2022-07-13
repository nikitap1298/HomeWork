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
    
    @IBAction func speedButton(_ sender: UIButton) {
        speedAlert()
    }
    
    // MARK: - Private Functions
    private func colorAlert() {
        let alert = UIAlertController(title: nil, message: "Choose car color", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Default", style: .default) { action in
            UserDefaults.standard.set("Yellow", forKey: K.car)
        }
        let secondAction = UIAlertAction(title: "Red", style: .default) { action in
            UserDefaults.standard.set("Red", forKey: K.car)
        }
        let thirdAction = UIAlertAction(title: "Blue", style: .default) { action in
            UserDefaults.standard.set("Blue", forKey: K.car)
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
            UserDefaults.standard.set("Grass", forKey: K.barrier)
        }
        let secondAction = UIAlertAction(title: "Barrier", style: .default) { action in
            UserDefaults.standard.set("Barrier", forKey: K.barrier)
        }
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }
    
    private func speedAlert() {
        let alert = UIAlertController(title: nil, message: "Choose speed", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Default", style: .default) { action in
            UserDefaults.standard.set(2.5, forKey: K.speed)
        }
        let secondAction = UIAlertAction(title: "Slower", style: .default) { action in
            UserDefaults.standard.set(3.5, forKey: K.speed)
        }
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }
    
}

