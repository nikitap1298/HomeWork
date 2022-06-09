//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita Pishchugin on 08.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Private Properties
    private var isTyping = false
    private var firstNumber: Double = 0
    private var secondNumber: Double = 0
    private var sign: String = ""
    
    private var currentValue: Double {
        get {
            return Double(valueLabel.text!)!
        }
        set {
            valueLabel.text = String(newValue)
            isTyping = false
        }
    }
    
    // MARK: - Public Properties
    
    // MARK: - IBOutlet
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func simpleMathButton(_ sender: UIButton) {
        sign = sender.currentTitle!
        firstNumber = currentValue
        isTyping = false
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if isTyping {
            if valueLabel.text!.count < 10 {
                valueLabel.text = valueLabel.text! + number
            }
        } else if number == "0" {
            isTyping = false
        } else {
            valueLabel.text = number
            isTyping = true
        }
        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if isTyping {
            secondNumber = currentValue
        }
        
        switch sign {
        case "÷":
            simpleMath {$0 / $1}
        case "✕":
            simpleMath {$0 * $1}
        case "-":
            simpleMath {$0 - $1}
        default:
            simpleMath {$0 + $1}
        }
    }
    
    // MARK: - Private Functions
    private func simpleMath(operation: (Double, Double) -> Double) {
        currentValue = operation(firstNumber, secondNumber)
        isTyping = false
    }
}

