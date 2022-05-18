//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beerName.text = "\(Beer.shared.name). Made in \(Beer.shared.country)"
        //Beer.shared.sellOne()
    }
    
    @IBAction func checkRemaining(_ sender: UIButton) {
        mainLabel.text = "\(Beer.shared.remaining())"
    }
    
    @IBAction func sellOneButton(_ sender: Any) {
        mainLabel.text = "\(Beer.shared.sellOne())"
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = "Earned: \(Beer.shared.earning()) Euro"
    }
}

