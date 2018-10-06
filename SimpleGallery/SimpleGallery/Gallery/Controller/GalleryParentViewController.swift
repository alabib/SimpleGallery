//
//  GalleryParentViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryParentViewController: UIViewController {
    
    
    var gallery : ImgurRoot?
    var galleryImages = [ImgurImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func prepareDataSource(WithGallery gallery: ImgurRoot?) {
        galleryImages.removeAll()
        if gallery != nil {
            self.gallery = gallery
            guard let galleryData  = (gallery?.data.filter{$0.images.count > 0})else {return}
            for data in galleryData {
                for image in data.images {
                    if !image.animated {
                        galleryImages.append(image)
                    }
                }
            }
        } else {
            showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), viewController: self, closure: nil)
            return
        }
    }
    
    func loadData() {
        
    }
    
    
}
