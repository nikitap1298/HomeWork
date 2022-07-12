//
//  RecordsViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDictionary = UserDefaults.standard.object(forKey: "DictionaryKey") as? [String: Int]
        print(userDictionary?.keys ?? "User not found")
        print(userDictionary?.values ?? 0)
    }
}
