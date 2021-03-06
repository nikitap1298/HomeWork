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
    private var photoArray = [UIImage]()
    private var imageNumber = -1
    
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorGreen")
        rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressView)))
        scrollView.isScrollEnabled = false
        customBar()
        
        setUpFileManager()
        
        registerForKeyboardNotifications()
        
        // Save photos into array
        let photos = UserDefaults.standard.imageArray(forKey: K.photoArray)
        photoArray = photos ?? [UIImage]()
        
        let number = UserDefaults.standard.value(forKey: K.imageNumber) as? Int
        imageNumber = number ?? 0
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        setUpCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - IBActions
    @IBAction func addButton(_ sender: UIButton) {
        pressPhotoButton()
        imageNumber += 1
        UserDefaults.standard.set(imageNumber, forKey: K.imageNumber)
    }
    @IBAction func showButton(_ sender: UIButton) {
        showPhotos()
        collectionView.reloadData()
    }
    
    
    // MARK: - Private Functions
    private func setUpCollection() {
        let customCell = UINib(nibName: "CustomCell", bundle: nil)
        collectionView.register(customCell, forCellWithReuseIdentifier: "CustomCell")
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (section, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(self.collectionView.frame.height))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging
            return section
        }
    }
    
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
    
    // MARK: - ScrollView
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
            photoArray.append(image)
            UserDefaults.standard.set(photoArray, forKey: K.photoArray)
        }
        
        // Close picker after choose photo
        picker.dismiss(animated: true)
    }
}

// Helps to save array of UIImages into UserDefaults
extension UserDefaults {
    func imageArray(forKey key: String) -> [UIImage]? {
        guard let array = self.array(forKey: key) as? [Data] else {
            return nil
        }
        return array.compactMap() { UIImage(data: $0) }
    }
    
    func set(_ imageArray: [UIImage], forKey key: String) {
        self.set(imageArray.compactMap({ $0.pngData() }), forKey: key)
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

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.setImage(image: photoArray[indexPath.row])
        return cell
    }
    
    
}
