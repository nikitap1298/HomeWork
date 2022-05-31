//
//  SecondViewController.swift
//  HomeWork_6
//
//  Created by Nikita Pishchugin on 25.05.2022.
//

import UIKit

//MARK: - Enum
enum Color {
    case red
    case blue
    case green
    case brown
    case magenta
    case purple
    case orange
    case yellow
    case gray
    case black
    case cyan
}

// For iPhone 13 Pro
class SecondViewController: UIViewController {
    
    //MARK: - Private Properties
    private var n: Int = 0
    private var x: Int = 0
    private var y: Int = 0
    private let colorArray: [UIColor] = [.red,
                                         .blue,
                                         .green,
                                         .brown,
                                         .magenta,
                                         .purple,
                                         .orange,
                                         .yellow,
                                         .gray,
                                         .black,
                                         .cyan]
    
    // User must to change only side value
    let side = 100
    let square = UIView()
    
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
                let square = UIView()
                let label = UILabel(frame: CGRect(x: CGFloat(side / 2 ) - 35, y: CGFloat(side / 2 ) - 20, width: 70, height: 40))
                label.backgroundColor = .white
                label.textAlignment = .center
                label.font = .systemFont(ofSize: 15)
                square.addSubview(label)
                
                square.frame = CGRect(x: CGFloat(x * side), y: CGFloat(y * side), width: CGFloat(side), height: CGFloat(side))
                square.backgroundColor = colorArray.randomElement()
                view.addSubview(square)
                
                label.text = "\(getColor(square.backgroundColor!))"
                n += 1
                x += 1
                
                if n % numberH == 0 {
                    x = 0
                    y += 1
                }
            }
        }
    }
    
    private func getColor(_ color: UIColor) -> String {
        switch color {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        case .brown:
            return "Brown"
        case .magenta:
            return "Magenta"
        case .purple:
            return "Purple"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .gray:
            return "Gray"
        case .black:
            return "Black"
        case .cyan:
            return "Cyan"
        default:
            return "Error"
        }
    }
}

//MARK: - Extensions

// This extension used to add custom value type (UIColor) to the enum
extension Color: RawRepresentable {
    typealias RawValue = UIColor
    
    init?(rawValue: RawValue) {
            switch rawValue {
            default:
                return nil
            }
        }

    var rawValue: RawValue {
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
