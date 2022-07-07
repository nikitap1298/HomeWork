//
//  ThirdTaskViewController.swift
//  HomeWork_14
//
//  Created by Nikita Pishchugin on 07.07.2022.
//


// Enter "secondtask" in UIAlertController

import UIKit

class ThirdTaskViewController: UIViewController {
    
    // MARK: - Private Properties
    private var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = ""
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 20)
        textLabel.backgroundColor = .clear
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private var callAlertButton: UIButton = {
        let callAlertButton = UIButton()
        callAlertButton.backgroundColor = .white
        callAlertButton.translatesAutoresizingMaskIntoConstraints = false
        return callAlertButton
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        customButtonFont()
        setUpCallAlertButton()
        setUpTextLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        callAlertButton.layer.cornerRadius = callAlertButton.frame.height / 2
    }
    
    // MARK: - Private Functions
    private func setUpTextLabel() {
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textLabel.bottomAnchor.constraint(equalTo: callAlertButton.topAnchor, constant: -200),
            textLabel.widthAnchor.constraint(equalToConstant: 250),
            textLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func customButtonFont() {
        let customString = "Enter your password"
        let attrString = NSMutableAttributedString(string: customString)
        let range1 = (customString as NSString).range(of: "Enter")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemRed, range: range1)
        let range2 = (customString as NSString).range(of: "your")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: range2)
        let range3 = (customString as NSString).range(of: "password")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range3)
        self.callAlertButton.setAttributedTitle(attrString, for: .normal)
    }
    
    private func setUpCallAlertButton() {
        view.addSubview(callAlertButton)
        
        NSLayoutConstraint.activate([
            callAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            callAlertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            callAlertButton.widthAnchor.constraint(equalToConstant: 200),
            callAlertButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        callAlertButton.addTarget(self, action: #selector(pressCallAlertButton), for: .touchUpInside)
    }
    
    // Alert with TextField
    @objc private func pressCallAlertButton() {
        let alert = UIAlertController(title: "Enter your password", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.isSecureTextEntry = true
        let submitAction = UIAlertAction(title: "Log In", style: .default) { _ in
            let answer = alert.textFields?.first
            
            if answer?.text == "secondtask" {
                self.showSecondTaskVC()
            }
            
            self.textLabel.text = "Wrong password: \(answer?.text ?? "Error")"
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    
    private func showSecondTaskVC() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SecondTaskViewController")
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .coverVertical
        present(viewController, animated: true)
    }
    
}
