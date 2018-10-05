//
//  GalleryGridViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryGridViewController: GalleryParentViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewCellIdentifier = "GalleryCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib.init(nibName: collectionViewCellIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        collectionView.dataSource = self
        collectionView.reloadData()
        
    }

}


extension GalleryGridViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellIdentifier, for: indexPath) as? GalleryCollectionViewCell else { fatalError() }
        let ImageObject = galleryImages[indexPath.row]
        cell.configCell(with: ImageObject)
        return cell
    }
    
}
