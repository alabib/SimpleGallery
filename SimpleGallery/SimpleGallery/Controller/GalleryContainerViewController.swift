//
//  GalleryContainerViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

class GalleryContainerViewController: UIViewController {

    var switchView: (() -> ())?
    
    @IBOutlet weak var layoutSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "GALLERY".localized()
        self.layoutSegmentedControl.setTitle("LIST".localized(), forSegmentAt: 0)
        self.layoutSegmentedControl.setTitle("GRID".localized(), forSegmentAt: 1)
    }
    
    
    @IBAction func layoutChanged(_ sender: Any) {
        
        if let switchViewClosure = switchView {
            switchViewClosure()
        }
    }

}
