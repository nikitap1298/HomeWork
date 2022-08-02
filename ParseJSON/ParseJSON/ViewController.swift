//
//  ViewController.swift
//  ParseJSON
//
//  Created by Nikita Pishchugin on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonData = readLocalData() else {
            return
        }
        let decoder = JSONDecoder()
        guard let quiz = try? decoder.decode(Q.self, from: jsonData) else {
            return
        }
        print(quiz.quiz)
    }
    
    // MARK: - Private Functions
    private func readLocalData() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "example", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("Error")
        }
        return nil
    }


}

