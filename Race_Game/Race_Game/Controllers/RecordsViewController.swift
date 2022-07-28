//
//  RecordsViewController.swift
//  Race_Game
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    
    // MARK: -  Private Properties
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var keyArray = [String]()
    private var valueArray = [Int]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userDictionary = UserDefaults.standard.object(forKey: K.userDefaultsKey) as? [String: Int] {
            for (key, value) in userDictionary {
                print("User: \(key); Score: \(value)")
                keyArray.append(key)
                valueArray.append(value)
            }
        }
        
        if let dateDict = UserDefaults.standard.object(forKey: K.userDateKey) as? [String: String] {
            for (key, value) in dateDict {
                print("User: \(key); Date: \(value)")
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableView()
    }
    
    // MARK: - Private Functions
    private func setUpTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(keyArray[indexPath.row]) - \(valueArray[indexPath.row]) points"
        return cell
    }
}
