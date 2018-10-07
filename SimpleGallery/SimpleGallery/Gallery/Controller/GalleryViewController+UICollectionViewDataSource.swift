//
//  GalleryViewController+UITableViewDataSource.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 10/7/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as? GalleryCollectionViewCell else { fatalError() }
        let ImageObject = galleryImages[indexPath.row]
        cell.configCell(with: ImageObject)
        cell.present = {[weak self] viewController in
            self?.present(viewController, animated: true, completion: nil)
        }
        return cell
    }
    
}
