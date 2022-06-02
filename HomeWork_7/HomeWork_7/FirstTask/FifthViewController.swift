//
//  FifthViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class FifthViewController: UIViewController {
    
    //MARK: - Public Properties
    var greeting = ""
    
    //MARK: - IBOutlet
    @IBOutlet weak var textLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = greeting
    }
}
