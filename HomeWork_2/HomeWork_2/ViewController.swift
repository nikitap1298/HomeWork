//
//  ViewController.swift
//  HomeWork_2
//
//  Created by Nikita Pishchugin on 11.05.2022.
//

import UIKit

//MARK: - ViewController
class ViewController: UIViewController {
    
    // Для 4 пункта, чтобы зациклить функцию
    let n = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        First.plus(2, 3)
        First.plus(2.4, 5.3)
        
        First.minus(2, 3)
        First.minus(2.4, 5.3)
        
        First.multiply(2, 3)
        First.multiply(2.4, 5.3)
        
        First.divide(2, 3)
        First.divide(-2.4, 5.3)
        
        // 2
        Second.sumOfNumbers(80106)
        
        // 3
        Third.compare("авб", "ввш")
        
        // 4. По логике приложение ломается, потому что функция будет вызываться бесконечно. CPU загружается на 90% временами
//        while n > 0 {
//            Fourth.crash(n: 1)
//        }
        
        // 5
        Fifth.degree(n1: 2, n2: 3)
        Fifth.degree(n1: 3)
        
        //6
        Sixth.factorial(5)
        
    }

}

//MARK: - First
class First {
    
    // 1.1. Plus
    static func plus(_ number0: Int, _ number1: Int) {
        let sum = number0 + number1
        print("\(number0) + \(number1) is equal: \(sum)")
    }
    
    static func plus(_ number0: Double, _ number1: Double) {
        let sum = number0 + number1
        print("\(number0) + \(number1) is equal: \(sum)")
    }
    
    // 1.2. Minus
    static func minus(_ number0: Int, _ number1: Int) {
        let min = number0 - number1
        print("\(number0) - \(number1) is equal \(min)")
    }
    
    static func minus(_ number0: Double, _ number1: Double) {
        let min = number0 - number1
        print("\(number0) - \(number1) is equal \(min)")
    }
    
    // 1.3. Multiply
    static func multiply(_ number0: Int, _ number1: Int) {
        let mul = number0 * number1
        print("\(number0) multiply by \(number1) is equal: \(mul)")
    }
    
    static func multiply(_ number0: Double, _ number1: Double) {
        let mul = number0 * number1
        print("\(number0) multiply by \(number1) is equal: \(mul)")
    }
    
    // 1.4. Divide
    static func divide(_ number0: Int, _ number1: Int) {
        let div = Double(number0) / Double(number1)
        print("\(number0) divided by \(number1) is equal: \(div)")
    }
    
    static func divide(_ number0: Double, _ number1: Double) {
        let div = number0 / number1
        print("\(number0) divided by \(number1) is equal: \(div)")
    }
    
}

//MARK: - Second
class Second {
    
    static func sumOfNumbers(_ mainNumber: Int) {
        
        // After
        var sum = 0
        let str = String(mainNumber)
        for n in str {
            sum += Int(String(n)) ?? 0
        }
        print("sum of \(mainNumber) is equal: \(sum)")
        
        // Before
//        let fourthN = mainNumber % 10
//        let thirdN =  (mainNumber / 10) % 10
//        let secondN = (mainNumber / 100) % 10
//        let firstN = (mainNumber / 1000) % 10
//        let summ = firstN + secondN + thirdN + fourthN
//        print("sum of \(mainNumber) is equal: \(summ)")
    }
}

//MARK: - Third
class Third {
    
    static func compare(_ line0: String, _ line1: String) {
        if line0 > line1 {
            print("\(line0) more then \(line1)")
        } else if line0 < line1 {
            print("\(line0) less then \(line1)")
        } else {
            print("\(line0) is equal to \(line1)")
        }
    }
}

//MARK: - Fourth
class Fourth {
    
    static func crash(n: Int) {
        print(n)
    }
}

//MARK: - Fifth
class Fifth {
    
    static func degree(n1: Int, n2: Double = 2) {
        let total = Int(pow(Double(n1), n2))
        print("\(n1) to the \(n2) degree is equal: \(total)")
    }
}

//MARK: - Sixth
class Sixth {
    
    // Рекурсивная функция, которая может вызывать сама себя. Используют для нахожения факториала
    static func factorial(_ number: Int) {
        var n = 1
        for i in 1...number {
            n *= i
        }
        print("factorial \(number) is equal: \(n)")
    }
}
