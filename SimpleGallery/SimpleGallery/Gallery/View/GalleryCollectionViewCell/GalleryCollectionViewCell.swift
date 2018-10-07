//
//  GalleryCollectionViewCell.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/6/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import NYTPhotoViewer

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openImageButton: UIButton!
    
    @IBOutlet weak var galleryImageViewToConntainerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabelHeightConstraint: NSLayoutConstraint!
    
    var present: ((_ viewController : UIViewController) -> ())?
    var imgurImage : ImgurImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadowFor(containerView)
        setupRoundedCornerFor(containerView)
    }
    
    func configCell(with imgurImage: ImgurImage!) {
        self.imgurImage = imgurImage
        if let description = imgurImage.descriptionField {
            descriptionLabel.text = description
            descriptionLabel.isHidden = false
            galleryImageViewToConntainerViewBottomConstraint.priority = UILayoutPriority(rawValue: 250)
            descriptionLabelHeightConstraint.priority = UILayoutPriority(rawValue: 500)
        } else {
            descriptionLabel.isHidden = true
            galleryImageViewToConntainerViewBottomConstraint.priority = UILayoutPriority(rawValue: 500)
            descriptionLabelHeightConstraint.priority = UILayoutPriority(rawValue: 250)
        }
        
        if let imageUrlString = imgurImage.link {
            
            setImageOfUrlStr(str: imageUrlString, imageV: galleryImageView)
        }
    }
    
    @IBAction func openImageAction(_ sender: Any) {
        let dataSource = newTimesBuildingDataSource()
        let photosViewController = NYTPhotosViewController(dataSource: dataSource, initialPhoto: nil, delegate: self)
        guard let presentClosure = present else {return}
        presentClosure(photosViewController)
    }
    
    func newTimesBuildingDataSource() -> NYTPhotoViewerArrayDataSource {
        var photos = Array<NYTPhoto>()
        let photo = Photo()
        
        photo.image = galleryImageView.image
        photo.attributedCaptionSummary = attributedSummaryFromString(imgurImage?.descriptionField ?? "")
        photos.append(photo)
        
        return NYTPhotoViewerArrayDataSource(photos: photos)
    }
    
    func attributedSummaryFromString(_ summary : String) -> NSAttributedString {
        return NSAttributedString(string: summary, attributes: [
            .foregroundColor : UIColor.lightGray,
            .font : UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
            ])
    }
    
}

// MARK: NYTPhotosViewControllerDelegate

extension GalleryCollectionViewCell: NYTPhotosViewControllerDelegate {
    
    func photosViewController(_ photosViewController: NYTPhotosViewController, referenceViewFor photo: NYTPhoto) -> UIView? {
        return galleryImageView
    }
    
    func photosViewController(_ photosViewController: NYTPhotosViewController, maximumZoomScaleFor photo: NYTPhoto) -> CGFloat {
        return 1.0
    }
    
    func photosViewController(_ photosViewController: NYTPhotosViewController, captionViewRespectsSafeAreaFor photo: NYTPhoto) -> Bool {
        return true
    }
    
}
