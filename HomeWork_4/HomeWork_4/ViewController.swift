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
        let beer0 = Beer(name: "Berliner Kindl", price: 0.39, country: "Germany", remainingVolume: 190)
        let beer1 = Beer(name: "Pilsner Urquell", price: 0.31, country: "Czech Republic", remainingVolume: 169)
        let beer2 = Beer(name: "Černa Horá Velen", price: 0.28, country: "Czech Republic", remainingVolume: 205)
        Pub.singleton.beer.append(contentsOf: [beer0, beer1, beer2])
        
        mainLabel.text = "Remaining: 0"
    }
    @IBAction func leftButton(_ sender: UIButton) {
        Pub.singleton.isWorking = 0
        mainLabel.text = ("\(Pub.singleton.sellOne())")
    }
    
    @IBAction func centerButton(_ sender: UIButton) {
        Pub.singleton.isWorking = 1
        mainLabel.text = ("\(Pub.singleton.sellOne())")
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        Pub.singleton.isWorking = 2
        mainLabel.text = "\(Pub.singleton.sellOne())"
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = ("Earn: \(Pub.singleton.earning()) Euro")
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        mainLabel.text = ("Remaining: \(Pub.singleton.checkRemaining()); Earn: \(Pub.singleton.resetEarning())")
    }
    
}

