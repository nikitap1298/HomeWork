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
//        guard let imagePath = imagePath?.appendingPathComponent("image_\(imageNumber).jpeg") else {
//            return
//        }
//
//        guard let data = try? Data(contentsOf: imagePath) else { return }
//        let image = UIImage(data: data)
        
        do {
            let items = try fileManager.contentsOfDirectory(atPath: imagePath!.path)

            for item in items {
                print("Found picture in Image directory: \(item)")
            }
        } catch {
            print("error")
        }
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
    
}

// MARK: - Extension for using PhotoPicker
extension LibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            
            // Get image
            guard let data = image.jpegData(compressionQuality: 10),
                  let imagePath = imagePath?.appendingPathComponent("image_\(imageNumber).jpeg") else { return }
            
            fileManager.createFile(atPath: imagePath.path, contents: data)
        }
        
        // Close picker after choose photo
        picker.dismiss(animated: true)
    }
}
