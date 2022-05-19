//
//  ViewController.swift
//  HomeWork_4
//
//  Created by Nikita Pishchugin on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerCountry: UILabel!
    @IBOutlet weak var beerPrice: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Pub.singleton.beer.name = "Pilsner Urquell"
//        Pub.singleton.beer.price = 0.31
//        Pub.singleton.beer.country = "Czech Republic"
//        Pub.singleton.beer.remainingVolume = 39
//        Pub.singleton.total = Pub.singleton.beer.remainingVolume
        
        beerName.text = "Beer:"
        beerCountry.text = "Country:"
        beerPrice.text = "Price:"
        mainLabel.text = "Remaining: 0"
    }
    @IBAction func leftButton(_ sender: UIButton) {
        Pub.singleton.beer.name = "Berliner Kindl"
        Pub.singleton.beer.price = 0.42
        Pub.singleton.beer.country = "Germany"
        Pub.singleton.beer.remainingVolume = 45
        Pub.singleton.total = Pub.singleton.beer.remainingVolume
        
        beerName.text = "Beer: \(Pub.singleton.beer.name)"
        beerCountry.text = "Country: \(Pub.singleton.beer.country)"
        beerPrice.text = "Price: \(Pub.singleton.beer.price) Euro for bottle"
        mainLabel.text = "Remaining: \(Pub.singleton.remaining()) bottles"
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        Pub.singleton.beer.name = "Pilsner Urquell"
        Pub.singleton.beer.price = 0.31
        Pub.singleton.beer.country = "Czech Republic"
        Pub.singleton.beer.remainingVolume = 39
        Pub.singleton.total = Pub.singleton.beer.remainingVolume
        
        beerName.text = "Beer: \(Pub.singleton.beer.name)"
        beerCountry.text = "Country: \(Pub.singleton.beer.country)"
        beerPrice.text = "Price: \(Pub.singleton.beer.price) Euro for bottle"
        mainLabel.text = "Remaining: \(Pub.singleton.remaining()) bottles"
    }
    
    @IBAction func sellOneButton(_ sender: UIButton) {
        mainLabel.text = "Remaining: \(Pub.singleton.sellOne()) bottles"

    }
    
    @IBAction func earnButton(_ sender: UIButton) {
        mainLabel.text = "Earn: \(Pub.singleton.earning()) Euro"
    }
    
    @IBAction func newDayButton(_ sender: UIButton) {
        mainLabel.text = "New Day. Remaining: \(Pub.singleton.checkRemaining()) bottles. Earn: \(Pub.singleton.resetEarning())"
    }
    
}

