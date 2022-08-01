//
//  CustomCollectionCell.swift
//  Photo_Library
//
//  Created by Nikita Pishchugin on 01.08.2022.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    // MARK: - Private Properties
    private var mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        likeButton.tintColor = .black
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        return likeButton
    }()
    
    private var commentButton: UIButton = {
        let commentButton = UIButton()
        commentButton.setImage(UIImage(systemName: "message.fill"), for: .normal)
        commentButton.tintColor = .black
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        return commentButton
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Comment"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
}
