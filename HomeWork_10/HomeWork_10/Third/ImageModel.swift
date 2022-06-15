//
//  ImageModel.swift
//  HomeWork_10
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

struct ImageModel {
    var name: UIImage
    
    static func fetchImages() -> [UIImageView] {
        let image1: UIImageView = {
            let image1 = UIImageView()
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = .init(named: "flower1")
            image1.contentMode = .scaleToFill
            return image1
        }()
        let image2: UIImageView = {
            let image2 = UIImageView()
            image2.translatesAutoresizingMaskIntoConstraints = false
            image2.image = .init(named: "flower2")
            image2.contentMode = .scaleToFill
            return image2
        }()
        let image3: UIImageView = {
            let image3 = UIImageView()
            image3.translatesAutoresizingMaskIntoConstraints = false
            image3.image = .init(named: "horses")
            image3.contentMode = .scaleToFill
            return image3
        }()
        let image4: UIImageView = {
            let image4 = UIImageView()
            image4.translatesAutoresizingMaskIntoConstraints = false
            image4.image = .init(named: "tree")
            image4.contentMode = .scaleToFill
            return image4
        }()
        
        return [image1, image2, image3, image4]
    }
}
