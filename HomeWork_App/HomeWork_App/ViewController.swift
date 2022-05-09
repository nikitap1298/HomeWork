//
//  ViewController.swift
//  HomeWork_App
//
//  Created by Nikita Pishchugin on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {

    let number: Int = 10
    let numberD: Double = 1.204
    let statement: Bool = true
    let word: String = "Hello World"
    var letter: Character = "A"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print(number)
        print(numberD)
        print(statement)
        print(word)
        letter = "B"
        print(letter)
    }
}

