//
//  LibraryViewController.swift
//  Photo_Library
//
//  Created by Nikita Pishchugin on 14.07.2022.
//

import UIKit

class LibraryViewController: UIViewController {
    
    // MARK: - Private Properties
    private let fileManager = FileManager.default
    private var imagePath: URL?
    private var photoArray = [Data]()
    private var imageNumber = -1
    
    private var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .white
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flower")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var imageViewTopAnchor: NSLayoutConstraint?
    
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
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsLabel: [UIButton]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorGreen")
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressView)))
        
        setUpFileManager()
        setUpMainView()
        
        // Save photos into array
//        let photos = UserDefaults.standard.object(forKey: K.photoArray) as? [Data]
//        photoArray = photos ?? [Data]()
        
        let number = UserDefaults.standard.value(forKey: K.imageNumber) as? Int
        imageNumber = number ?? 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for buttons in buttonsLabel {
            buttons.layer.cornerRadius = 15
        }
    }
    
    // MARK: - IBActions
    @IBAction func addPhotoButton(_ sender: UIButton) {
        pressPhotoButton()
        imageNumber += 1
        UserDefaults.standard.set(imageNumber, forKey: K.imageNumber)
    }
    @IBAction func showPhotosButton(_ sender: UIButton) {
        showPhotos()
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        deletePhotos()
    }
    
    
    // MARK: - Private Functions
    private func pressPhotoButton() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        pickerController.delegate = self
        present(pickerController, animated: true)
    }
    
    private func setUpFileManager() {
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let imagesDirectoryPath = documentsPath?.appendingPathComponent("Images") else  { return }
        print(documentsPath!.path)
        imagePath = imagesDirectoryPath
        
        if fileManager.fileExists(atPath: imagesDirectoryPath.path) == false {
            print("New directory created")
            
            do {
                try fileManager.createDirectory(atPath: imagesDirectoryPath.path, withIntermediateDirectories: true)
            } catch {
                print("error")
            }
        }
    }
    
    private func showPhotos() {
        do {
            let items = try fileManager.contentsOfDirectory(atPath: imagePath!.path)

            for item in items {
                print("Found picture in Image directory: \(item)")
            }
        } catch {
            print("error")
        }
        
        // Save photos into array
//        do {
//            let items = try fileManager.contentsOfDirectory(atPath: imagePath!.path)
//
//            for item in items {
//                print("Found picture in Image directory: \(item)")
//            }
//        } catch {
//            print("error")
//        }
    }
    
    private func deletePhotos() {
        let alert = UIAlertController(title: "Delete file", message: nil, preferredStyle: .alert)
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Delete", style: .default) { [self] _ in
            let name = alert.textFields?.first?.text
            
            guard let imagePath = imagePath?.appendingPathComponent("\(name!).jpeg") else { return }
            
            do {
                try fileManager.removeItem(at: imagePath)
            } catch {
                print("error")
            }
        }
        alert.addAction(submitAction)
        present(alert, animated: true)
        
    }
    
    // MARK: - ScrollView
    private func setUpMainView() {
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            mainView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
        setUpImageView()
        setUpLikeButton()
        setUpCommentButton()
    }
    
    private func setUpImageView() {
        mainView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 330)
        ])
        
        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0)
        
        guard let imageViewTopAnchor = imageViewTopAnchor else {
            return
        }

        imageViewTopAnchor.isActive = true
    }
    
    private func setUpLikeButton() {
        mainView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            likeButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30),
            likeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setUpCommentButton() {
        mainView.addSubview(commentButton)
        
        NSLayoutConstraint.activate([
            commentButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            commentButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30),
            commentButton.widthAnchor.constraint(equalToConstant: 30),
            commentButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        commentButton.addTarget(self, action: #selector(pressCommentButton), for: .touchUpInside)
    }
    
    @objc private func pressCommentButton() {
        print("hi")
        setUpTextView()
    }
    
    private func setUpTextView() {
        mainView.addSubview(textField)
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 60),
            textField.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func pressView() {
        view.endEditing(true)
    }
    
}

// MARK: - Extension for using PhotoPicker
extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
            // Get image
            guard let data = image.jpegData(compressionQuality: 10),
                  let imagePath = imagePath?.appendingPathComponent("image_\(imageNumber).jpeg") else { return }
            
            fileManager.createFile(atPath: imagePath.path, contents: data)
            
            // Save images into array
//            let encoder = try! PropertyListEncoder().encode(data)
//            photoArray.append(encoder)
//            UserDefaults.standard.set(photoArray, forKey: K.photoArray)
        }
        
        // Close picker after choose photo
        picker.dismiss(animated: true)
    }
}

extension LibraryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
