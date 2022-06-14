//
//  CaruselViewController.swift
//  HomeWork_10
//
//  Created by Nikita Pishchugin on 14.06.2022.
//

import UIKit

class CaruselViewController: UIViewController {
    
    // MARK: - Private Properties
    private var imageArray = [UIImageView]()
    
    private var image1: UIImageView = {
        let image1 = UIImageView()
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.image = .init(named: "flower1")
        image1.contentMode = .scaleToFill
        return image1
    }()
    
    // MARK: - Public Properties
    var image1TopAnchor: NSLayoutConstraint?
    var image1LeadingAnchor: NSLayoutConstraint?
    var image1TrailingAnchor: NSLayoutConstraint?
    var image1BottomAnchor: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray.append(image1)
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
            UIView.animate(withDuration: 2.0) {
                self.image1LeadingAnchor?.constant = 0
                self.image1TrailingAnchor?.constant = 0
                self.view.layoutIfNeeded()
            }
        case .right:
            UIView.animate(withDuration: 2.0) {
                self.image1LeadingAnchor?.constant = 1000
                self.image1TrailingAnchor?.constant = 1000
                self.view.layoutIfNeeded()
            }
        default:
            break
        }
    }
    
    // MARK: - Private Functions
    private func setupUI() {
        view.addSubview(image1)
        
        image1TopAnchor = image1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        image1LeadingAnchor = image1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        image1TrailingAnchor = image1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        image1BottomAnchor = image1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let image1TopAnchor = image1TopAnchor,
              let image1LeadingAnchor = image1LeadingAnchor,
              let image1TrailingAnchor = image1TrailingAnchor,
              let image1BottomAnchor = image1BottomAnchor
        else {
            return
        }
        
        image1TopAnchor.isActive = true
        image1LeadingAnchor.isActive = true
        image1TrailingAnchor.isActive = true
        image1BottomAnchor.isActive = true
        
    }
    
    // Helps to avoid code diplication when create gesture recognizers
    private func swipeGesture(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        // Init Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(recognizer: )))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
}
