//
//  LibraryViewController.swift
//  HomeWork_16
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
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsLabel: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorGreen")
        
        setUpFileManager()
        
        let photos = UserDefaults.standard.object(forKey: "PhotoArray") as? [Data]
        photoArray = photos ?? [Data]()
        
        let number = UserDefaults.standard.value(forKey: "ImageNumber") as? Int
        imageNumber = number ?? 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for buttons in buttonsLabel {
            buttons.layer.cornerRadius = 30
        }
    }
    
    // MARK: - IBActions
    @IBAction func addPhotoButton(_ sender: UIButton) {
        pressPhotoButton()
        imageNumber += 1
        UserDefaults.standard.set(imageNumber, forKey: "ImageNumber")
    }
    @IBAction func showPhotosButton(_ sender: UIButton) {
        showPhotos()
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
    
    private func showPhotos() {
//        guard let imagePath = imagePath?.appendingPathComponent("image_\(imageNumber).jpeg") else {
//            return
//        }
//
//        guard let data = try? Data(contentsOf: imagePath) else { return }
//        let image = UIImage(data: data)
        
        print("Number of photos in directory: \(photoArray.count)")
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
            
            let encoded = try! PropertyListEncoder().encode(data)
            photoArray.append(encoded)
            UserDefaults.standard.set(photoArray, forKey: "PhotoArray")
        }
        
        // Close picker after choose photo
        picker.dismiss(animated: true)
    }
}
