//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Public Properties
    // Different beeer in the Pub
    let beer0 = Beer(name: "Berliner Kindl", price: 0.39, country: "Germany", remainingVolume: 190, total: 0)
    let beer1 = Beer(name: "Pilsner Urquell", price: 0.31, country: "Czech Republic", remainingVolume: 169, total: 0)
    let beer2 = Beer(name: "Černa Horá Velen", price: 0.28, country: "Czech Republic", remainingVolume: 205, total: 0)
    
    //MARK: - IBOutlets
    @IBOutlet weak var mainLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Pub.singleton.beer.append(contentsOf: [beer0, beer1, beer2])
        
        mainLabel.text = "Remaining: 0"
    }
    
    //MARK: - IBActions
    @IBAction func leftButton(_ sender: UIButton) {
        
        // Find index of a specific Item in Array
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == beer0.name })
        mainLabel.text = ("\(Pub.singleton.sellOne(n: index ?? 0))")
    }
    
    @IBAction func centerButton(_ sender: UIButton) {
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == beer1.name })
        mainLabel.text = ("\(Pub.singleton.sellOne(n: index ?? 0))")
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        let index = Pub.singleton.beer.firstIndex(where: { $0.name == beer2.name })
        mainLabel.text = ("\(Pub.singleton.sellOne(n: index ?? 0))")
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = ("Earn: \(Pub.singleton.earning()) Euro")
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        mainLabel.text = ("Remaining: \(Pub.singleton.checkRemaining()); Earn: \(Pub.singleton.resetEarning())")
    }
    
}

