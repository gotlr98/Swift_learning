//
//  ViewController.swift
//  Photo_tutorial
//
//  Created by HaeSik Jang on 2023/06/26.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileChangeButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileChangeButton.layer.cornerRadius = 20
        
        self.profileChangeButton.addTarget(self, action: #selector(onButtonClicked), for: .touchUpInside)
    }
    
    @objc fileprivate func onButtonClicked(){
        
        var config = YPImagePickerConfiguration()
        config.screens = [.library]
        config.library.mediaType = .photo
        
        let picker = YPImagePicker(configuration: config)
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                self.profileImage.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
//        profileImage.image(picker)
    }

}

