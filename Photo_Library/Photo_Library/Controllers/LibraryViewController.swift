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
    
    private var deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.backgroundColor = UIColor(named: "ColorBlue")
        deleteButton.layer.cornerRadius = 18
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteButton
    }()
    
    private var addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Add Photos", for: .normal)
        addButton.backgroundColor = UIColor(named: "ColorBlue")
        addButton.layer.cornerRadius = 18
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    private var showButton: UIButton = {
        let showButton = UIButton()
        showButton.setTitle("Show Photos", for: .normal)
        showButton.backgroundColor = UIColor(named: "ColorBlue")
        showButton.layer.cornerRadius = 18
        showButton.translatesAutoresizingMaskIntoConstraints = false
        return showButton
    }()
    
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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rootView: UIView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorGreen")
        rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressView)))
        scrollView.isScrollEnabled = false
        customBar()
        
        setUpFileManager()
        
        setUpMainView()
        setUpButtons()
        
        registerForKeyboardNotifications()
        
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
    
    // MARK: - Private Functions
    private func pressPhotoButton() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .photoLibrary
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
    
    @objc private func showPhotos() {
        // Get images from FileManager
        do {
            let items = try fileManager.contentsOfDirectory(atPath: imagePath!.path)

            for item in items {
                print("Found picture in Image directory: \(item)")
            }
        } catch {
            print("error")
        }
        
    }
    
    @objc private func deletePhotos() {
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
    
    @objc private func pressAddButton() {
        pressPhotoButton()
        imageNumber += 1
        UserDefaults.standard.set(imageNumber, forKey: K.imageNumber)
    }
    
    // MARK: - ScrollView
    private func setUpMainView() {
        rootView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 10),
            mainView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 50),
            mainView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -50),
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
        print("Comment Button")
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
    
    private func setUpButtons() {
        rootView.addSubview(showButton)
        rootView.addSubview(deleteButton)
        rootView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 50),
            deleteButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 50),
            deleteButton.widthAnchor.constraint(equalToConstant: 120),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            
            addButton.topAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -50),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            
            showButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 50),
            showButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor, constant: 0),
            showButton.widthAnchor.constraint(equalToConstant: 120),
            showButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        deleteButton.addTarget(self, action: #selector(deletePhotos), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(pressAddButton), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(showPhotos), for: .touchUpInside)
    }
    
    @objc private func pressView() {
        view.endEditing(true)
    }
    
    private func registerForKeyboardNotifications() {
        let showNotification = UIResponder.keyboardWillShowNotification
        NotificationCenter.default.addObserver(forName: showNotification, object: nil, queue: .main) { notification in
            if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.scrollView.contentOffset = CGPoint(x: 0, y: keyBoardSize.height - 100)
            }
        }
        
        let hideNotification = UIResponder.keyboardWillHideNotification
        NotificationCenter.default.addObserver(forName: hideNotification, object: nil, queue: .main) { _ in
            self.scrollView.contentOffset = CGPoint(x: 0, y: -100)
        }
    }
    
}

// MARK: - Extension for using PhotoPicker
extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
            // Save image
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLenght = 30
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLenght
    }
}

extension LibraryViewController {
    func customBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "ColorGreen")
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        // Remove bottom border in NavifationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        
    }
}
