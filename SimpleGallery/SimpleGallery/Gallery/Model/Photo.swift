//
//  Photo.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/6/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import NYTPhotoViewer


class Photo : NSObject, NYTPhoto {
    var image : UIImage?
    var imageData : Data?
    var placeholderImage : UIImage?
    var attributedCaptionTitle: NSAttributedString?
    var attributedCaptionCredit: NSAttributedString?
    var attributedCaptionSummary : NSAttributedString?
}
