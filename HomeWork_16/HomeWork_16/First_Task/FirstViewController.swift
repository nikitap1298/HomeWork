//
//  ViewController.swift
//  HomeWork_16
//
//  Created by Nikita Pishchugin on 14.07.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.button.setTitle("Ddd", for: .normal)
    }


}

