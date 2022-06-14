//
//  ImageCollectionViewCell.swift
//  Carousel
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "ImageCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        return mainImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
