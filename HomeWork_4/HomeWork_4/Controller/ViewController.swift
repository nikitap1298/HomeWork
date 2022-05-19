//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerCountry: UILabel!
    @IBOutlet weak var beerPrice: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Pub.singleton.beer.name = "Pilsner Urquell"
        Pub.singleton.beer.price = 0.31
        Pub.singleton.beer.country = "Czech Republic"
        Pub.singleton.beer.remainingVolume = 39
        Pub.singleton.beer.total = Pub.singleton.beer.remainingVolume
        
        beerName.text = "Beer: \(Pub.singleton.beer.name)"
        beerCountry.text = "Country: \(Pub.singleton.beer.country)"
        beerPrice.text = "Price: \(Pub.singleton.beer.price) Euro for bottle"
        
    }
    
    @IBAction func checkRemaining(_ sender: UIButton) {
        mainLabel.text = "\(Pub.singleton.remaining())"
    }
    
    @IBAction func sellOneButton(_ sender: Any) {
        mainLabel.text = "\(Pub.singleton.sellOne())"
    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = "Earn: \(Pub.singleton.earning()) Euro"
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        //mainLabel.text = "Earn in one day: \(Pub.singleton.reset()) Euro"
    }
}

