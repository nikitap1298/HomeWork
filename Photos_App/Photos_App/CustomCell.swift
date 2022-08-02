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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
}
