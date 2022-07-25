//
//  BrowserViewController.swift
//  Browser
//
//  Created by Nikita Pishchugin on 21.07.2022.
//

import UIKit

class BrowserViewController: UIViewController {
    
    // MARK: - Private Properties
    private var webView: UIWebView = {
        let webView = UIWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private var previousButton: UIButton = {
        let previousButton = UIButton()
        previousButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        previousButton.tintColor = .black
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        return previousButton
    }()
    
    private var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        nextButton.tintColor = .black
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()
    
    private var reloadButton: UIButton = {
        let reloadButton = UIButton()
        reloadButton.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        reloadButton.tintColor = .black
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        return reloadButton
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search something"
        textField.textAlignment = .center
        textField.backgroundColor = .systemGray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Public Properties
    var searchText: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        
        setupTextField()
        setupWebView()
        setupUI()
    }
    
    // MARK: - Actions
    @objc private func didTapView() {
        view.endEditing(true)
    }
    
    @objc private func pressPreviousButton() {
        if webView.canGoBack == true {
            webView.goBack()
        }
    }
    
    @objc private func pressNextButton() {
        if webView.canGoForward == true {
            webView.goForward()
        }
    }
    
    /* Добавил кнопку перезагрузки страницы. Не совсем понимаю для чего нужно ставить загрузку на паузу как в задании.
    А так, чтобы остановить загрузку надо написать webView.stopLoading() */
    @objc private func pressReloadButton() {
        webView.reload()
    }
    
    // MARK: - Private Functions
    private func setupTextField() {
        view.addSubview(textField)
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupWebView() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
        
        let string = "https://google.com/search?q=\(searchText)"
        guard let url = URL(string: string) else { return }
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
    }
    
    private func setupUI() {
        view.addSubview(previousButton)
        view.addSubview(nextButton)
        view.addSubview(reloadButton)
        
        NSLayoutConstraint.activate([
            previousButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 30),
            previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            previousButton.widthAnchor.constraint(equalToConstant: 30),
            previousButton.heightAnchor.constraint(equalToConstant: 30),
            
            nextButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 30),
            nextButton.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 30),
            nextButton.widthAnchor.constraint(equalToConstant: 30),
            nextButton.heightAnchor.constraint(equalToConstant: 30),
            
            reloadButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 30),
            reloadButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            reloadButton.widthAnchor.constraint(equalToConstant: 30),
            reloadButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        previousButton.addTarget(self, action: #selector(pressPreviousButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(pressNextButton), for: .touchUpInside)
        reloadButton.addTarget(self, action: #selector(pressReloadButton), for: .touchUpInside)
    }
}

extension BrowserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText = textField.text ?? ""
        setupWebView()
        textField.text = ""
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
