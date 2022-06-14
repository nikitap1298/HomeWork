//
//  ViewController.swift
//  Carousel
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties
    private var imageCollectionView = ImageCollectionView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // MARK: - Private Functions
    private func setupUI() {
        view.addSubview(imageCollectionView)
        
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        imageCollectionView.set(cells: ImageModel.fethcImages())
    }

}

