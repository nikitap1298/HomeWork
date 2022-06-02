//
//  AdditionalViewController.swift
//  HomeWork_7
//
//  Created by Nikita Pishchugin on 02.06.2022.
//

import UIKit

class AdditionalViewController: UIViewController {
    
    //MARK: - Public Properties
    var animalName = ""
    var animalMaxAge = 0
    var animalSpeed = 0
    
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = animalName
        ageLabel.text = "Max Age: \(animalMaxAge)"
        speedLabel.text = "Max Speed: \(animalSpeed)"
    }
}
