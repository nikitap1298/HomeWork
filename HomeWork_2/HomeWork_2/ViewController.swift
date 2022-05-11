//
//  ViewController.swift
//  HomeWork_2
//
//  Created by Nikita Pishchugin on 11.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
        First.divide(2.4, 5.3)
        
        // 2
        Second.sumOfNumbers(3429)
        
        // 4. По логике приложение ломается, потому что функция будет вызываться бесконечно. CPU загружается на 90% временами
//        while n > 0 {
//            Fourth.crash(n: 1)
//        }
        
        // 5
        Fifth.expo(n1: 2, n2: 3)
        
        //6
        let factorial = Sixth.factorial(5)
        print(factorial)
        
    }

}

class First {
    
    // 1.1. Plus
    static func plus(_ number0: Int, _ number1: Int) {
        let sum = number0 + number1
        print(sum)
    }
    
    static func plus(_ number0: Double, _ number1: Double) {
        let sum = number0 + number1
        print(sum)
    }
    
    // 1.2. Minus
    static func minus(_ number0: Int, _ number1: Int) {
        let sum = number0 - number1
        print(sum)
    }
    
    static func minus(_ number0: Double, _ number1: Double) {
        let sum = number0 - number1
        print(sum)
    }
    
    // 1.3. Multiply
    static func multiply(_ number0: Int, _ number1: Int) {
        let sum = number0 * number1
        print(sum)
    }
    
    static func multiply(_ number0: Double, _ number1: Double) {
        let sum = number0 * number1
        print(sum)
    }
    
    // 1.4. Divide
    static func divide(_ number0: Int, _ number1: Int) {
        let sum = Double(number0) / Double(number1)
        print(sum)
    }
    
    static func divide(_ number0: Double, _ number1: Double) {
        let sum = number0 / number1
        print(sum)
    }
    
}

class Second {
    
    static func sumOfNumbers(_ number: Int) {
        
    }
}

class Third {
    
}

class Fourth {
    
    static func crash(n: Int) {
        print(n)
    }
}

class Fifth {
    
    static func expo(n1: Int, n2: Double) {
        let total = Int(pow(Double(n1), n2))
        print(total)
    }
}

class Sixth {
    
    // Рекурсивная функция, которая может вызывать сама себя. Используют для нахожения факториала
    static func factorial(_ number: Int) -> Int{
        if number == 0{
            return 1
        } else {
            return number * factorial(number-1)
        }
    }
}
