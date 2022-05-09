//
//  ViewController.swift
//  HomeWork_App
//
//  Created by Nikita Pishchugin on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let number0 = 2.5
    let number1 = 9.7
    let number2 = 6.9
    let number3 = 8.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sum = number0 + number1 + number2 + number3
        let integer = floor(sum)
        let fractional = sum.truncatingRemainder(dividingBy: 1)

        if integer.truncatingRemainder(dividingBy: 2.0) == 0 {
            print("Even. Number: \(integer)")
        } else {
            print("Not even. Number: \(integer)")
        }

        if fractional.truncatingRemainder(dividingBy: 2.0) == 0 {
            print("Even. Number: \(fractional)")
        } else {
            print("Not even. Number: \(fractional)")
        }
    }
}

