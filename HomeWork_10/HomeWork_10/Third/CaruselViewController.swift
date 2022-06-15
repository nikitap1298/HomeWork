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
    
    private var imageArray = ImageModel.fetchImages()
    
    // MARK: - Public Properties
    var image1TopAnchor: NSLayoutConstraint?
    var image1LeadingAnchor: NSLayoutConstraint?
    var image1TrailingAnchor: NSLayoutConstraint?
    var image1BottomAnchor: NSLayoutConstraint?
    
    var image2TopAnchor: NSLayoutConstraint?
    var image2LeadingAnchor: NSLayoutConstraint?
    var image2TrailingAnchor: NSLayoutConstraint?
    var image2BottomAnchor: NSLayoutConstraint?
    
    var image3TopAnchor: NSLayoutConstraint?
    var image3LeadingAnchor: NSLayoutConstraint?
    var image3TrailingAnchor: NSLayoutConstraint?
    var image3BottomAnchor: NSLayoutConstraint?
    
    var image4TopAnchor: NSLayoutConstraint?
    var image4LeadingAnchor: NSLayoutConstraint?
    var image4TrailingAnchor: NSLayoutConstraint?
    var image4BottomAnchor: NSLayoutConstraint?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer()
        setupFirstImage()
        setupSecondImage()
        setupThirdImage()
        setupFourthImage()
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
            numberLeftSwipes += 1
            if numberLeftSwipes == 1 {
                UIView.animate(withDuration: 2.0) {
                    self.image1LeadingAnchor?.constant = -1000
                    self.image1TrailingAnchor?.constant = -1000
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image2LeadingAnchor?.constant = 0
                    self.image2TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
            if numberLeftSwipes == 2 {
                UIView.animate(withDuration: 2.0) {
                    self.image2LeadingAnchor?.constant = -1000
                    self.image2TrailingAnchor?.constant = -1000
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image3LeadingAnchor?.constant = 0
                    self.image3TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
            if numberLeftSwipes == 3 {
                UIView.animate(withDuration: 2.0) {
                    self.image3LeadingAnchor?.constant = -1000
                    self.image3TrailingAnchor?.constant = -1000
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image4LeadingAnchor?.constant = 0
                    self.image4TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
            }
        case .right:
            if numberLeftSwipes == 3 {
                UIView.animate(withDuration: 2.0) {
                    self.image3LeadingAnchor?.constant = 0
                    self.image3TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image4LeadingAnchor?.constant = 1000
                    self.image4TrailingAnchor?.constant = 1000
                    self.view.layoutIfNeeded()
                }
            }
            numberLeftSwipes -= 1
            if numberLeftSwipes == 1 {
                UIView.animate(withDuration: 2.0) {
                    self.image2LeadingAnchor?.constant = 0
                    self.image2TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image3LeadingAnchor?.constant = 1000
                    self.image3TrailingAnchor?.constant = 1000
                    self.view.layoutIfNeeded()
                }
            }
            if numberLeftSwipes == 0 {
                UIView.animate(withDuration: 2.0) {
                    self.image1LeadingAnchor?.constant = 0
                    self.image1TrailingAnchor?.constant = 0
                    self.view.layoutIfNeeded()
                }
                UIView.animate(withDuration: 2.0) {
                    self.image2LeadingAnchor?.constant = 1000
                    self.image2TrailingAnchor?.constant = 1000
                    self.view.layoutIfNeeded()
                }
            }
        default:
            break
        }
    }
    
    // MARK: - Private Functions
    private func setupFirstImage() {
        view.addSubview(imageArray[0])
        
        image1TopAnchor = imageArray[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        image1LeadingAnchor = imageArray[0].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        image1TrailingAnchor = imageArray[0].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        image1BottomAnchor = imageArray[0].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let image1TopAnchor = image1TopAnchor,
              let image1LeadingAnchor = image1LeadingAnchor,
              let image1TrailingAnchor = image1TrailingAnchor,
              let image1BottomAnchor = image1BottomAnchor else { return }
        
        image1TopAnchor.isActive = true
        image1LeadingAnchor.isActive = true
        image1TrailingAnchor.isActive = true
        image1BottomAnchor.isActive = true
        
    }
    
    private func setupSecondImage() {
        view.addSubview(imageArray[1])
        
        image2TopAnchor = imageArray[1].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        image2LeadingAnchor = imageArray[1].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        image2TrailingAnchor = imageArray[1].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        image2BottomAnchor = imageArray[1].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let image2TopAnchor = image2TopAnchor,
              let image2LeadingAnchor = image2LeadingAnchor,
              let image2TrailingAnchor = image2TrailingAnchor,
              let image2BottomAnchor = image2BottomAnchor else { return }
        
        image2TopAnchor.isActive = true
        image2LeadingAnchor.isActive = true
        image2TrailingAnchor.isActive = true
        image2BottomAnchor.isActive = true
        
    }
    
    private func setupThirdImage() {
        view.addSubview(imageArray[2])
        
        image3TopAnchor = imageArray[2].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        image3LeadingAnchor = imageArray[2].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        image3TrailingAnchor = imageArray[2].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        image3BottomAnchor = imageArray[2].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let image3TopAnchor = image3TopAnchor,
              let image3LeadingAnchor = image3LeadingAnchor,
              let image3TrailingAnchor = image3TrailingAnchor,
              let image3BottomAnchor = image3BottomAnchor else { return }
        
        image3TopAnchor.isActive = true
        image3LeadingAnchor.isActive = true
        image3TrailingAnchor.isActive = true
        image3BottomAnchor.isActive = true
        
    }
    
    private func setupFourthImage() {
        view.addSubview(imageArray[3])
        
        image4TopAnchor = imageArray[3].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        image4LeadingAnchor = imageArray[3].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1000)
        image4TrailingAnchor = imageArray[3].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 1000)
        image4BottomAnchor = imageArray[3].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        
        guard let image4TopAnchor = image4TopAnchor,
              let image4LeadingAnchor = image4LeadingAnchor,
              let image4TrailingAnchor = image4TrailingAnchor,
              let image4BottomAnchor = image4BottomAnchor else { return }
        
        image4TopAnchor.isActive = true
        image4LeadingAnchor.isActive = true
        image4TrailingAnchor.isActive = true
        image4BottomAnchor.isActive = true
        
    }
    
    // Helps to avoid code diplication when create gesture recognizers
    private func swipeGesture(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        
        // Init Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(recognizer: )))
        swipeGestureRecognizer.direction = direction
        return swipeGestureRecognizer
    }
    
    private func timer() {
        Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) { (timer) in
            UIView.animate(withDuration: 2.0) {
                self.image1LeadingAnchor?.constant = 0
                self.image1TrailingAnchor?.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
}
