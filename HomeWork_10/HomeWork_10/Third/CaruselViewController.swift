//
//  CaruselViewController.swift
//  HomeWork_10
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class CaruselViewController: UIViewController {
    
    // MARK: - Private Properties
    private var numberLeftSwipes = 0
    private var numberRightSwipe = 0
    private var n = 0
    
    private var imageArray = ImageModel.fetchImages()
    
//    private var image1: UIImageView = {
//        let image1 = UIImageView()
//        image1.translatesAutoresizingMaskIntoConstraints = false
//        image1.image = .init(named: "flower1")
//        image1.contentMode = .scaleToFill
//        return image1
//    }()
    
    // MARK: - Public Properties
    var imageTopAnchor: NSLayoutConstraint?
    var imageLeadingAnchor: NSLayoutConstraint?
    var imageTrailingAnchor: NSLayoutConstraint?
    var imageBottomAnchor: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.addGestureRecognizer(swipeGesture(for: .left))
        view.addGestureRecognizer(swipeGesture(for: .right))
    }
    
    // MARK: - Action
    @objc private func didSwipe(recognizer: UISwipeGestureRecognizer) {
        switch recognizer.direction {
        case .left:
            if numberLeftSwipes == 0 {
                UIView.animate(withDuration: 2.0) {
                    self.imageLeadingAnchor?.constant = 0
                    self.imageTrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
            numberLeftSwipes += 1
            if numberLeftSwipes == 2 {
                UIView.animate(withDuration: 2.0) {
                    self.imageLeadingAnchor?.constant = -1000
                    self.imageTrailingAnchor?.constant = -1000
                    self.view.layoutIfNeeded()
                }
                numberLeftSwipes -= 1
            }
        case .right:
            if numberLeftSwipes == 1 && numberRightSwipe == 0 {
                UIView.animate(withDuration: 2.0) {
                    self.imageLeadingAnchor?.constant = 0
                    self.imageTrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        default:
            break
        }
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        view.addSubview(imageArray[0])
        
        imageTopAnchor = imageArray[n].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        imageLeadingAnchor = imageArray[n].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        imageTrailingAnchor = imageArray[n].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        imageBottomAnchor = imageArray[n].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let imageTopAnchor = imageTopAnchor,
              let imageLeadingAnchor = imageLeadingAnchor,
              let imageTrailingAnchor = imageTrailingAnchor,
              let imageBottomAnchor = imageBottomAnchor
        else {
            return
        }
        
        imageTopAnchor.isActive = true
        imageLeadingAnchor.isActive = true
        imageTrailingAnchor.isActive = true
        imageBottomAnchor.isActive = true
        
    }
    
    // Helps to avoid code diplication when create gesture recognizers
    private func swipeGesture(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        // Init Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(recognizer: )))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
}
