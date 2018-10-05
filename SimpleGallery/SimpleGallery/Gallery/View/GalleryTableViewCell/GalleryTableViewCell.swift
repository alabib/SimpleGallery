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
    
    let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

            setImageOfUrlStr(str: imageUrlString, imageV: galleryImageView)
        }
        
        DispatchQueue.main.async {
            
            self.gradientLayer.frame = self.galleryImageView.bounds;
            
            let whiteColor = UIColor(white: 0, alpha: 0.1)
            let blackColor = UIColor(white: 0, alpha: 0.9)
            
            self.gradientLayer.colors = [whiteColor.cgColor,whiteColor.cgColor,whiteColor.cgColor, blackColor.cgColor]
            self.galleryImageView?.layer.insertSublayer(self.gradientLayer, at: 0)
        }
    }
    
}
