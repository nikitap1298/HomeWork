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
    
    // MARK: - Public Properties
    var searchText: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        setupUI()
    }
    
    // MARK: - Private Functions
    private func setupWebView() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
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
}
