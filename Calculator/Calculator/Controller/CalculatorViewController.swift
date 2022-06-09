//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita Pishchugin on 08.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Private Properties
    
    // Helps to understand that new number is entering
    private var isTyping: Bool = false
    
    // First operand (number before user press math button)
    private var firstNumber: Double = 0
    
    // Second operand (number after user press math button)
    private var secondNumber: Double = 0
    private var sign: String = ""
    private var commaPlaced: Bool = false
    
    // Computed Property. Transform String into Double
    private var currentValue: Double {
        get {
            return Double(valueLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                valueLabel.text = "\(valueArray[0])"
            } else {
                valueLabel.text = "\(newValue)"
            }
            isTyping = false
        }
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet var buttonsLabel: [UIButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Makes each button round
        for i in buttonsLabel {
            i.layer.cornerRadius = i.frame.height / 2
        }
    }
    
    // MARK: - IBActions
    @IBAction func numberButton(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        // If isTyping = true then we add new digit on the screen
        if isTyping {
            
            // Max 10 digits for label
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
    @IBAction func simpleMathButton(_ sender: UIButton) {
        sign = sender.currentTitle!
        firstNumber = currentValue
        
        // When user press " +, -, *, / " programm understand that user stop entering digit
        isTyping = false
        commaPlaced = false
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if isTyping {
            secondNumber = currentValue
        }
        
        commaPlaced = false

        switch sign {
        case "÷":
            currentValue = firstNumber / secondNumber
            isTyping = false
        case "✕":
            currentValue = firstNumber * secondNumber
            isTyping = false
        case "−":
            currentValue = firstNumber - secondNumber
            isTyping = false
        default:
            currentValue = firstNumber + secondNumber
            isTyping = false
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        switch sender.currentTitle {
        case "AC":
            firstNumber = 0
            secondNumber = 0
            currentValue = 0
            valueLabel.text = "0"
            isTyping = false
            commaPlaced = false
            sign = ""
        case "+/-":
            currentValue = -currentValue
        case "%":
            if firstNumber == 0 {
                currentValue = currentValue / 100
            } else {
                currentValue = firstNumber / 100
            }
            isTyping = false
        default:
            if isTyping && commaPlaced == false {
                valueLabel.text = valueLabel.text! + "."
                commaPlaced = true
            } else if isTyping == false && commaPlaced == false  {
                valueLabel.text = "0."
            }
        }
    }
    
}
