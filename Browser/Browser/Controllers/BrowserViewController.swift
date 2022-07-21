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
    
    // MARK: - Public Properties
    var searchText: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(searchText)
        
        setupWebView()
    }
    
    // MARK: - Private Functions
    private func setupWebView() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        let string = "https://google.com/search?q=\(searchText)"
        guard let url = URL(string: string) else { return }
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
    }
}
