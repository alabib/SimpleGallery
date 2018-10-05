//
//  GalleryTableViewCell.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/5/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadowFor(containerView)
        setupRoundedCornerFor(containerView)
    }
    
    @IBAction func openImageAction(_ sender: Any) {
        
    }
    
    func configCell(with imgurImage: ImgurImage!) {
        
        if let description = imgurImage.descriptionField {
            descriptionLabel.text = description
        } else {
            descriptionLabel.text = ""
        }
        
        if let imageUrlString = imgurImage.link {

            setImageOfUrlStr(str: imageUrlString, imageV: galleryImageView, completionHandler: nil)
        }
    }
    
}
