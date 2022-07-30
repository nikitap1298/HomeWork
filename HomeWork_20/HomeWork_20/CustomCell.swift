//
//  CustomCell.swift
//  HomeWork_20
//
//  Created by Nikita Pishchugin on 30.07.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - IBAction
    @IBAction func button(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        mainView.backgroundColor = nil
        label.text = nil
    }
    
    func setUpView(with color: UIColor) {
        mainView.backgroundColor = color
    }
    
    func setUpLabel(with text: String) {
        label.text = text
    }
    
}
