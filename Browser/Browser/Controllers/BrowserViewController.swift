//
//  BrowserViewController.swift
//  Browser
//
//  Created by Nikita Pishchugin on 21.07.2022.
//

import UIKit

class BrowserViewController: UIViewController {
    
    // MARK: - Private Properties
    var searchText: String = ""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(searchText)
    }
    
}
