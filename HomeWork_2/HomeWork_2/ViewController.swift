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
        let plusI = First.plus(2, 3)
        print("plusI \(plusI)")
        
        let plusD = First.plus(2.4, 5.3)
        print("plusD \(plusD)")
        
        let minusI = First.minus(2, 3)
        print("minusI \(minusI)")
        
        let minusD = First.minus(2.4, 5.3)
        print("minusD \(minusD)")
        
        let mulI = First.multiply(2, 3)
        print("mulI \(mulI)")
        
        let mulD = First.multiply(2.4, 5.3)
        print("mulD \(mulD)")
        
        let divI = First.divide(2, 3)
        print("divI \(divI)")
        
        let divD = First.divide(-2.4, 5.3)
        print("divD \(divD)")
        
        // 2
        let sumOfNumbers = Second.sumOfNumbers(80106)
        print("sumOfNumbers \(sumOfNumbers)")
        
        // 3
        let compare = Third.compare("авб", "ввш")
        print(compare)
        
        // 4. По логике приложение ломается, потому что функция будет вызываться бесконечно. CPU загружается на 90% временами
//        while n > 0 {
//            let crash = Fourth.crash(n: 1)
//            print(crash)
//        }
        
        // 5
        let degree0 = Fifth.degree(n1: 2, n2: 3)
        print("degree0 \(degree0)")
        
        let degree1 = Fifth.degree(n1: 3)
        print("degree1 \(degree1)")
        
        //6
        let facorial = Sixth.factorial(5)
        print("facorial \(facorial)")
        
    }

}

//MARK: - First
class First {
    
    // 1.1. Plus
    static func plus(_ number0: Int, _ number1: Int) -> Int {
        let sum = number0 + number1
        return sum
    }
    
    static func plus(_ number0: Double, _ number1: Double) -> Double {
        let sum = number0 + number1
        return sum
    }
    
    // 1.2. Minus
    static func minus(_ number0: Int, _ number1: Int) -> Int{
        let min = number0 - number1
        return min
    }
    
    static func minus(_ number0: Double, _ number1: Double) -> Double {
        let min = number0 - number1
        return min
    }
    
    // 1.3. Multiply
    static func multiply(_ number0: Int, _ number1: Int) -> Int {
        let mul = number0 * number1
        return mul
    }
    
    static func multiply(_ number0: Double, _ number1: Double) -> Double{
        let mul = number0 * number1
        return mul
    }
    
    // 1.4. Divide
    static func divide(_ number0: Int, _ number1: Int) -> Double {
        let div = Double(number0) / Double(number1)
        return div
    }
    
    static func divide(_ number0: Double, _ number1: Double) -> Double{
        let div = number0 / number1
        return div
    }
    
}

//MARK: - Second
class Second {
    
    static func sumOfNumbers(_ mainNumber: Int) -> Int {
        
        var sum = 0
        let str = String(mainNumber)
        for n in str {
            sum += Int(String(n)) ?? 0
        }
        return sum
    }
}

//MARK: - Third
class Third {
    
    static func compare(_ line0: String, _ line1: String) -> String {
        if line0 > line1 {
            return "line0 > line1"
        } else if line0 < line1 {
            return "line0 < line1"
        } else {
            return "line0 = line1"
        }
    }
}

//MARK: - Fourth
class Fourth {
    
    static func crash(n: Int) -> Int {
        return n
    }
}

//MARK: - Fifth
class Fifth {
    
    static func degree(n1: Int, n2: Double = 2) -> Int {
        let total = Int(pow(Double(n1), n2))
        return total
    }
}

//MARK: - Sixth
class Sixth {
    
    // Рекурсивная функция, которая может вызывать сама себя. Используют для нахожения факториала
    static func factorial(_ number: Int) -> Int{
        var n = 1
        for i in 1...number {
            n *= i
        }
        return n
    }
}
