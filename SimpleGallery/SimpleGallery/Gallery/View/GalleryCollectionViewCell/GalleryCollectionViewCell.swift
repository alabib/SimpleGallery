//
//  GalleryCollectionViewCell.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/6/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openImageButton: UIButton!
    
    var imageViewHeight : CGFloat! = CGFloat(integerLiteral: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadowFor(containerView)
        setupRoundedCornerFor(containerView)
    }
    
    func configCell(with imgurImage: ImgurImage!) {
        
        if let description = imgurImage.descriptionField {
            descriptionLabel.text = description
        } else {
            descriptionLabel.text = ""
        }
        
        if let imageUrlString = imgurImage.link {
            
            setImageOfUrlStr(str: imageUrlString, imageV: galleryImageView){ image in 
                self.imageViewHeight = image?.size.height
            }
        }
    }
    
    @IBAction func openImageAction(_ sender: Any) {
        
    }
}
