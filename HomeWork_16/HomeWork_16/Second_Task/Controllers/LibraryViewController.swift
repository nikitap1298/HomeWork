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
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsLabel: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "ColorGreen")
        
        setUpFileManager()
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
    }
    @IBAction func showPhotosButton(_ sender: UIButton) {
        showPhotos()
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
        print(documentsPath?.path)
        imagePath = imagesDirectoryPath
        
        if fileManager.fileExists(atPath: imagesDirectoryPath.path) == false {
            print("fff")
            
            do {
                try fileManager.createDirectory(atPath: imagesDirectoryPath.path, withIntermediateDirectories: true)
            } catch {
                print("error")
            }
        }
    }
    
    private func showPhotos() {
        guard let imagePath = imagePath?.appendingPathComponent("image.jpeg") else {
            return
        }

        guard let data = try? Data(contentsOf: imagePath) else { return }
        let image = UIImage(data: data)
        
        imageView.image = image

    }
    
}

// MARK: - Extension for using PhotoPicker
extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
            // Get image
            print(image.scale)
            
            guard let data = image.jpegData(compressionQuality: 10),
                  let imagePath = imagePath?.appendingPathComponent("image.jpeg") else { return }
            
            fileManager.createFile(atPath: imagePath.path, contents: data)
        }
        
        // Close picker after choose photo
        picker.dismiss(animated: true)
    }
}
