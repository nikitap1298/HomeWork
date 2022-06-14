//
//  ImageModel.swift
//  Carousel
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

struct ImageModel {
    var mainImage: UIImage
    
    static func fethcImages() -> [ImageModel] {
        let firstImage = ImageModel(mainImage: UIImage(named: "flower1")!)
        let secondImage = ImageModel(mainImage: UIImage(named: "flower2")!)
        let thirdImage = ImageModel(mainImage: UIImage(named: "horses")!)
        let fourthImage = ImageModel(mainImage: UIImage(named: "tree")!)
        
        return  [firstImage, secondImage, thirdImage, fourthImage]
    }
}

struct K {
    static let leftSide: CGFloat = 45
    static let rightSide: CGFloat = 45
    static let imageMinimumLineSpacing: CGFloat = 20
    static let imageItemWidth = (UIScreen.main.bounds.width - K.leftSide - K.rightSide - (K.imageMinimumLineSpacing / 2)) / 1
}
