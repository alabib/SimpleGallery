//
//  GalleryViewController+StaggeredFlowLayoutDelegate.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/7/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

extension GalleryViewController : StaggeredFlowLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let ImageObject = galleryImages[indexPath.row]
        return CGFloat(ImageObject.height/4)
    }
    
}
