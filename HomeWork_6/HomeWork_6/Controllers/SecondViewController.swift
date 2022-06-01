//
//  SecondViewController.swift
//  HomeWork_6
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

// For iPhone 13 Pro
class SecondViewController: UIViewController {
    
    //MARK: - Enum
    private enum Color: String, CaseIterable {
        case red = "Red"
        case blue = "Blue"
        case green = "Green"
        case brown = "Brown"
        case magenta = "Magenta"
        case purple = "Purple"
        case orange = "Orange"
        case yellow = "Yellow"
        case gray = "Gray"
        case black = "Black"
        case cyan = "Cyan"
        
        var customColor: UIColor {
            switch self {
            case .red:
                return .red
            case .blue:
                return .blue
            case .green:
                return . green
            case .brown:
                return .brown
            case .magenta:
                return .magenta
            case .purple:
                return .purple
            case .orange:
                return . orange
            case .yellow:
                return .yellow
            case .gray:
                return .gray
            case .black:
                return .black
            case .cyan:
                return .cyan
            }
        }
    }
    
    //MARK: - Private Properties
    private var n: Int = 0
    private var x: Int = 0
    private var y: Int = 0
    
    // User must to change only side value
    private let side = 100
    private let square = UIView()
    
    //MARK: - IBOutlets
    @IBOutlet weak var fillButtonLabel: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        square.frame = CGRect(x: 50, y: 50, width: side, height: side)
        square.backgroundColor = .red
        view.addSubview(square)
        
    }
    
    //MARK: - IBAction
    @IBAction func fillButton(_ sender: UIButton) {
        fill()
    }
    
    //MARK: - Private Functions
    private func fill() {
        let numberH = Int(view.frame.maxX / square.frame.width) + 1
        let numberV = Int(view.frame.maxY / square.frame.height) + 1
        let total = numberH * numberV
        
        if side >= 100 {
            for _ in 0...total {
                let randomColor = Color.allCases.randomElement()!
                let square = UIView()
                square.frame = CGRect(x: CGFloat(x * side), y: CGFloat(y * side), width: CGFloat(side), height: CGFloat(side))
                square.backgroundColor = randomColor.customColor
                view.addSubview(square)
                
                let label = UILabel(frame: CGRect(x: CGFloat(side / 2 ) - 35, y: CGFloat(side / 2 ) - 20, width: 70, height: 40))
                label.backgroundColor = .white
                label.textAlignment = .center
                label.text = "\(randomColor.rawValue)"
                label.font = .systemFont(ofSize: 15)
                square.addSubview(label)
                
                n += 1
                x += 1
                
                if n % numberH == 0 {
                    x = 0
                    y += 1
                }
            }
        }
    }
    
}

