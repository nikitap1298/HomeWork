//
//  ImageModel.swift
//  HomeWork_10
//
//  Created by Nikita Pishchugin on 15.06.2022.
//

import UIKit

struct ImageModel {
    var name: UIImage
    
    static func fetchImages() -> [ImageModel] {
        let image1 = ImageModel(name: UIImage(named: "flower1")!)
        let image2 = ImageModel(name: UIImage(named: "flower2")!)
        let image3 = ImageModel(name: UIImage(named: "horses")!)
        let image4 = ImageModel(name: UIImage(named: "tree")!)
        
        return [image1, image2, image3, image4]
    }
}
