//
//  ViewController.swift
//  HomeWork_20
//
//  Created by Nikita Pishchugin on 30.07.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setUpTableView()
    }

}

private extension ViewController {
    func setUpTableView() {
        let customCell = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(customCell, forCellReuseIdentifier: "CustomCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
//        cell.textLabel?.text = "\(indexPath.row)"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        cell.callBack = { color in
            self.view.backgroundColor = color
        }
        cell.setUpView(with: .random())
        cell.setUpLabel(with: "\(indexPath.row)")
        return cell
    }

}
