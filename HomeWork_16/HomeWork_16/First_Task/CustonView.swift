//
//  CustonView.swift
//  HomeWork_16
//
//  Created by Nikita Pishchugin on 14.07.2022.
//

import UIKit

class CustomView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - IBAction
    @IBAction func button(_ sender: Any) {
        
    }
    
    // MARK: - Private Functions
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentView)
        contentView.frame = self.bounds
        button.layer.cornerRadius = 15
    }
}
