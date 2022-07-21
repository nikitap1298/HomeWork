//
//  ViewController.swift
//  Browser
//
//  Created by Nikita Pishchugin on 21.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Private Properties
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = false
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var rootView: UIView = {
        let rootView = UIView()
        rootView.backgroundColor = .white
        rootView.translatesAutoresizingMaskIntoConstraints = false
        return rootView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Google"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Welcome to Google"
        textField.textAlignment = .center
        textField.backgroundColor = .systemOrange
        textField.layer.cornerRadius = 15
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customFont()
        
        setupScrollView()
        setupRootView()
        setupLabel()
        setupTextField()
        
        registerForKeyboardNotifications()
    }
    
    // MARK: - Private Functions
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupRootView() {
        scrollView.addSubview(rootView)
        
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            rootView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            rootView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            rootView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            rootView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            rootView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
        
        rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressView)))
    }
    
    @objc private func pressView() {
        view.endEditing(true)
    }
    
    private func setupLabel() {
        rootView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: rootView.centerXAnchor, constant: 0),
            label.centerYAnchor.constraint(equalTo: rootView.centerYAnchor, constant: -50),
            label.widthAnchor.constraint(equalToConstant: 180),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    private func setupTextField() {
        rootView.addSubview(textField)
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func customFont() {
        let text = "Google"
        let attrString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "G")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range1)
        let range2 = (text as NSString).range(of: "oo")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemOrange, range: range2)
        let range3 = (text as NSString).range(of: "g")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: range3)
        let range4 = (text as NSString).range(of: "l")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: range4)
        let range5 = (text as NSString).range(of: "e")
        attrString.addAttribute(.foregroundColor, value: UIColor.systemRed, range: range5)
        label.attributedText = attrString
    }
    
    private func registerForKeyboardNotifications() {
        let showNotification = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(forName: showNotification, object: nil, queue: .main) { notification in
            if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.scrollView.contentOffset = CGPoint(x: 0.0, y: keyBoardSize.height - 150)
            }
        }
        
        let hideNotification = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(forName: hideNotification, object: nil, queue: .main) { _ in
            self.scrollView.contentOffset = .zero
        }
        
    }
    
    private func showBrowserVC() {
        let storyBoard = UIStoryboard(name: "Browser", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "BrowserViewController") as? BrowserViewController else { return }
        viewController.searchText = textField.text ?? ""
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension OnboardingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        showBrowserVC()
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLenght = 30
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLenght
    }
}

