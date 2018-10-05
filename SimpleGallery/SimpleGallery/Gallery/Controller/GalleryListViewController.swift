//
//  GalleryListViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryListViewController: GalleryParentViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let tableViewCellIdentifier = "GalleryTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: tableViewCellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.dataSource = self
        tableView.estimatedRowHeight = 130
        tableView.rowHeight = UITableView.automaticDimension
        self.animateTable()
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self.tableView, selector: #selector(UITableView.reloadData), name: UIDevice.orientationDidChangeNotification, object: nil)

    }
    
    // MARK: - Cells Animation Method
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a
            UIView.animate(withDuration: 1.0, delay: 0.10 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }

}

extension GalleryListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return galleryImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier , for: indexPath) as? GalleryTableViewCell else { fatalError() }
        
        let ImageObject = galleryImages[indexPath.row]
        cell.configCell(with: ImageObject)
        return cell
    }
}
