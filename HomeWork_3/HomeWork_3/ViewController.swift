//
//  ViewController.swift
//  HomeWork_3
//
//  Created by Nikita Pishchugin on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var x = [(1, "x"), (4, "y"), (6, "a"), (-3, "b")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xReady = x.map { Int(pow(Double($0.0), 2)) }.filter { $0 % 2 == 0 }.sorted { $0 > $1 }
        print(xReady)
    }

}
