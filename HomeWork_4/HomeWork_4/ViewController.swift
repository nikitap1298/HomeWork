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
        let beer0 = Beer(name: "Berliner Kindl", price: 1, country: "Germany", remainingVolume: 190, total: 0)
        let beer1 = Beer(name: "Pilsner Urquell", price: 2, country: "Czech Republic", remainingVolume: 169, total: 0)
        let beer2 = Beer(name: "Černa Horá Velen", price: 3, country: "Czech Republic", remainingVolume: 205, total: 0)
        Pub.singleton.beer.append(contentsOf: [beer0, beer1, beer2])
        
        mainLabel.text = "Remaining: 0"
    }
    @IBAction func leftButton(_ sender: UIButton) {
        
        // Find index of a specific Item in Array
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == "Berliner Kindl" })
        Pub.singleton.isWorking = index ?? 0
        mainLabel.text = ("\(Pub.singleton.sellOne(n: Pub.singleton.isWorking))")
    }
    
    @IBAction func centerButton(_ sender: UIButton) {
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == "Pilsner Urquell" })
        Pub.singleton.isWorking = index ?? 0
        mainLabel.text = ("\(Pub.singleton.sellOne(n: Pub.singleton.isWorking))")
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == "Černa Horá Velen" })
        Pub.singleton.isWorking = index ?? 0
        mainLabel.text = ("\(Pub.singleton.sellOne(n: Pub.singleton.isWorking))")
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = ("Earn: \(Pub.singleton.earning()) Euro")
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        mainLabel.text = ("Remaining: \(Pub.singleton.checkRemaining()); Earn: \(Pub.singleton.resetEarning())")
    }
    
}

