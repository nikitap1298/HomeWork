//
//  SecondTaskViewController.swift
//  HomeWork_14
//
//  Created by Nikita Pishchugin on 07.07.2022.
//

import UIKit

class SecondTaskViewController: UIViewController {
    
    // MARK: - Private Properties
    private var helloButton: UIButton = {
        let helloButton = UIButton()
        helloButton.backgroundColor = .brown
        helloButton.setTitle("Press me", for: .normal)
        helloButton.translatesAutoresizingMaskIntoConstraints = false
        return helloButton
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHelloButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.tintColor = .brown
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(pressNextButton))
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        helloButton.layer.cornerRadius = helloButton.frame.height / 2
    }
    
    // MARK: - Private Functions
    private func setUpHelloButton() {
        view.addSubview(helloButton)
        
        NSLayoutConstraint.activate([
            helloButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            helloButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            helloButton.widthAnchor.constraint(equalToConstant: 200),
            helloButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        helloButton.addTarget(self, action: #selector(pressHelloButton), for: .touchUpInside)
    }
    
    @objc private func pressHelloButton() {
//        customAlertOneAction(alertTitle: "Select your age",
//                             alertMessage: nil,
//                             alertStyle: .alert,
//                             actionTitle: "18+",
//                             actionStyle: .default)
//        customAlertTwoActions(alertTitle: "Select your age",
//                              alertMessage: nil,
//                              alertStyle: .actionSheet,
//                              firstActionTitle: "0-17",
//                              firstActionStyle: .default,
//                              secondActionTitle: "18+",
//                              secondActionStyle: .default)
        let alert = UIAlertController(title: "Select your age",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "0-17", style: .default) { action in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let secondAction = UIAlertAction(title: "18+", style: .default) { action in
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        let thirdAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
        }
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        alert.addAction(thirdAction)
        present(alert, animated: true)
        
    }
    
    @objc private func pressNextButton() {
        let storyboard = UIStoryboard(name: "Third", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdTaskViewController")
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// Extension for UiViewController using Alert
extension UIViewController {
    
    // Alert with 1 button
    func customAlertOneAction(alertTitle: String?,
                              alertMessage: String?,
                              alertStyle: UIAlertController.Style,
                              actionTitle: String?,
                              actionStyle: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let firstAction = UIAlertAction(title: actionTitle, style: actionStyle) { action in
            
        }
        alert.addAction(firstAction)
        present(alert, animated: true)
    }
    
    // Alert with 2 buttons
    func customAlertTwoActions(alertTitle: String?,
                               alertMessage: String?,
                               alertStyle: UIAlertController.Style,
                               firstActionTitle: String?,
                               firstActionStyle: UIAlertAction.Style,
                               secondActionTitle: String?,
                               secondActionStyle: UIAlertAction.Style) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let firstAction = UIAlertAction(title: firstActionTitle, style: firstActionStyle) { action in
            
        }
        let secondAction = UIAlertAction(title: secondActionTitle, style: secondActionStyle) { action in
            
        }
        alert.addAction(firstAction)
        alert.addAction(secondAction)
        present(alert, animated: true)
    }
    
}
