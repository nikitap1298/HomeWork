//
//  ViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Public Properties
    var totalScore = 0
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsLabel: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(named: "colorYellow")
        buttonsLabel.forEach { $0.addShadow() }
        buttonsLabel.forEach { $0.addCornerRadius() }
        scoreLabel.text = "Total score: \(totalScore)"
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

// MARK: - UI
extension UIView {
    func addShadow(shadowColor: UIColor = .black, offset: CGSize = .init(width: 3, height: 3), opacity: Float = 0.3, radius: CGFloat = 10) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
    func addCornerRadius() {
        layer.cornerRadius = layer.frame.height / 2
    }
}
