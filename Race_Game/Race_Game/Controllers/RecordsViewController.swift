//
//  RecordsViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    
    // MARK: -  IBOutlet
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userDictionary = UserDefaults.standard.object(forKey: K.userDefaultsKey) as? [String: Int] {
            for (key, value) in userDictionary {
//                label.text = "User: \(key); Score: \(value)"
                print("User: \(key); Score: \(value)")
            }
        }
//        print(userDictionary?.keys ?? "User not found")
//        print(userDictionary?.values ?? 0)
        
    }
}
