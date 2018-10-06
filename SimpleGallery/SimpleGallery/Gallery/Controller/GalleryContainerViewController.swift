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
    var filterWith: ((_ section: String, _ showViral: Bool) -> ())?
    
    @IBOutlet weak var layoutSegmentedControl: UISegmentedControl!
    @IBOutlet weak var viralSwitch: UISwitch!
    
    private var selectedSection = ImgurFilterSections.hot.rawValue
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

    @IBAction func filterAction(_ sender: Any) {
        let alert = UIAlertController(title: "Select", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Hot", style: .default , handler:{ (UIAlertAction)in
            self.selectedSection = ImgurFilterSections.hot.rawValue
            if let filterWithClosure = self.filterWith {
                filterWithClosure(self.selectedSection, self.viralSwitch.isOn)
            }
        }))
        alert.addAction(UIAlertAction(title: "Top", style: .default , handler:{ (UIAlertAction)in
            self.selectedSection = ImgurFilterSections.top.rawValue
            if let filterWithClosure = self.filterWith {
                filterWithClosure(self.selectedSection,self.viralSwitch.isOn)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showViralAction(_ sender: Any) {
        if let filterWithClosure = self.filterWith {
            filterWithClosure(self.selectedSection,self.viralSwitch.isOn)
        }
    }
}
