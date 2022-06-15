//
//  ViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var buttonsLabel: [UIButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "colorYellow")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in buttonsLabel {
            i.layer.cornerRadius = i.frame.height / 2
        }
    }
    
    // MARK: - IBActions
    @IBAction func raceButton(_ sender: UIButton) {
        showRace()
    }
    
    @IBAction func recordsButton(_ sender: UIButton) {
        showRecords()
    }
    
    @IBAction func settingsButton(_ sender: UIButton) {
        showSettings()
    }
    
    // MARK: - Private Functions
    private func showRace() {
        let storyboard = UIStoryboard(name: "Race", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RaceViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showRecords() {
        let storyboard = UIStoryboard(name: "Records", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecordsViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showSettings() {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

}

