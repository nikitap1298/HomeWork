//
//  ImageCollectionView.swift
//  Carousel
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class ImageCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    // All cells
    
    var cells = [ImageModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
//        backgroundColor = .cyan
        delegate = self
        dataSource = self
        register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = K.imageMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: K.leftSide, bottom: 0, right: K.rightSide)
        
        // Remove slider
        showsHorizontalScrollIndicator = false
    }
    
    func set(cells: [ImageModel]) {
        self.cells = cells
    }
    
    // Number of cells in a row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    // Setup the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseID, for: indexPath) as! ImageCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: K.imageItemWidth, height: frame.height * 0.8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
