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
                print("User: \(key); Score: \(value)")
            }
        }
        
        if let dateDict = UserDefaults.standard.object(forKey: K.userDateKey) as? [String: String] {
            for (key, value) in dateDict {
                print("User: \(key); Date: \(value)")
            }
        }
    }
}
