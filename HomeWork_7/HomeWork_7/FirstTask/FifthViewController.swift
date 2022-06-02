//
//  FifthViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class FifthViewController: UIViewController {
    
    var greeting = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = greeting
    }
}
