//
//  AdditionalViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class AdditionalViewController: UIViewController {
    
    //MARK: - Public Properties
    var animal = Animal(name: "", maxAge: 0, speed: 0)

    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = animal.name
        ageLabel.text = "Max Age: \(animal.maxAge)"
        speedLabel.text = "Max Speed: \(animal.speed)"
    }
}
