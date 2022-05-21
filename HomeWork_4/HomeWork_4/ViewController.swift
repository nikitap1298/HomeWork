//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sellButton(_ sender: UIButton) {
        mainLabel.text = "Remaining: \(Pub.singleton.sellOne()) bottles"
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = "Earn: \(Pub.singleton.earning()) Euro"
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        mainLabel.text = "New Day. Remaining: \(Pub.singleton.checkRemaining()) bottles. Earn: \(Pub.singleton.resetEarning())"
    }
    
}

