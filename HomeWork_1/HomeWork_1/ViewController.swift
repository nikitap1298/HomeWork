//
//  ViewController.swift
//  HomeWork_1
//
//  Created by Nikita Pishchugin on 18.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let number0 = 2.5
    let number1 = 9.7
    let number2 = 6.9
    let number3 = 8.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sumInt = Double(Int(number0)) + Double(Int(number1)) + Double(Int(number2)) + Double(Int(number3))
        
        // 1 вариант получения дробной части
        let sumFr = number0 + number1 + number2 + number3 - sumInt
        
        // 2 вариант получения дробной части
        // let sumFr1 = (number0 - Double(Int(number0))) + (number1 - Double(Int(number1))) + (number2 - Double(Int(number2))) + (number3 - Double(Int(number3)))
        
        if sumInt.truncatingRemainder(dividingBy: 2) == 0 {
            print("Even. Number: \(sumInt)")
        } else {
            print("Not even. Number: \(sumInt)")
        }
        
        if sumFr.truncatingRemainder(dividingBy: 2) == 0 {
            print("Even. Number: \(sumFr)")
        } else {
            print("Not even. Number: \(sumFr)")
        }
    }
}
