//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Beer.shared.remaining()
    }
    
    @IBAction func checkRemaining(_ sender: UIButton) {
        mainLabel.text = "\(Beer.shared.earnings())"
    }
    
    @IBAction func sellOneButton(_ sender: Any) {
        mainLabel.text = "\(Beer.shared.remaining())"
    }
    
}

