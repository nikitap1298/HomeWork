//
//  CustomCell.swift
//  Photos_App
//
//  Created by Nikita Pishchugin on 02.08.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        textField.text = nil
    }
    
    @IBAction func comment(_ sender: UIButton) {
        textField.isHidden = false
        textField.delegate = self
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
}

extension CustomCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
