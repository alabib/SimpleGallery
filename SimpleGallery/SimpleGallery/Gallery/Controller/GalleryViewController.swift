//
//  GalleryContainerViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import SVProgressHUD

class GalleryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var layoutSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var viralSwitch: UISwitch!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let gridFlowLayout = GridFlowLayout()
    private let listFlowLayout = ListFlowLayout()
    private let staggeredFlowLayout = StaggeredFlowLayout()
    
    var gallery : ImgurRoot?
    var galleryImages = [ImgurImage]()
    private var selectedSection = ImgurFilterSections.hot.rawValue
    internal let collectionViewCellIdentifier = "GalleryCollectionViewCell"
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "GALLERY".localized()
        self.layoutSegmentedControl.setTitle("LIST".localized(), forSegmentAt: 0)
        self.layoutSegmentedControl.setTitle("GRID".localized(), forSegmentAt: 1)
        self.layoutSegmentedControl.setTitle("STAGGERED".localized(), forSegmentAt: 2)
        
        collectionView.register(UINib.init(nibName: collectionViewCellIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        applyGridLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(applyGridLayout), name: UIDevice.orientationDidChangeNotification, object: nil)
        collectionView.dataSource = self
        staggeredFlowLayout.delegate = self
        getGallery(withSection: ImgurFilterSections.top.rawValue, showViral: true) { [unowned self] succeeded, response in
            if succeeded {
                guard let gallery = response as? ImgurRoot else {return}
                self.loadData(WithGallery: gallery)
            }
        }
    }
    
    // MARK: Network Call
    func getGallery(withSection section: String, showViral: Bool, completion: @escaping (Bool, Any?) -> Void) {
        
        SVProgressHUD.show()
        let serverManager = ServerManager()
        serverManager.getGalleryWith(section: section, showViral: showViral)
        serverManager.didFinish =
            { json in
                if let obj = json as? ImgurRoot
                {
                    completion(true,obj)
                } else {
                    completion(false,nil)
                    showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), viewController: self, closure: nil)
                }
                SVProgressHUD.dismiss()
        }
        serverManager.didFinishWithError =
            { code, err in
                SVProgressHUD.dismiss()
                completion(false,nil)
                showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), viewController: self, closure: nil)
        }
        
    }
    
    // MARK: Helper Methods
    func loadData(WithGallery gallery: ImgurRoot?) {
        prepareDataSource(WithGallery: gallery)
        guard let collectionView = collectionView else { return }
        collectionView.reloadData()
    }
    
    @objc func applyGridLayout() {
        UIView.animate(withDuration: 0.5) { [unowned self] () -> Void in
            self.collectionView.collectionViewLayout.invalidateLayout()
            
            switch self.layoutSegmentedControl.selectedSegmentIndex {
            case 0:
                self.collectionView.setCollectionViewLayout(self.listFlowLayout, animated: true)
            case 1:
                self.collectionView.setCollectionViewLayout(self.gridFlowLayout, animated: true)
            case 2:
                self.collectionView.setCollectionViewLayout(self.staggeredFlowLayout, animated: true)
            default:
                fatalError()
            }
        }
    }
    
    func prepareDataSource(WithGallery gallery: ImgurRoot?) {
        galleryImages.removeAll()
        if gallery != nil {
            self.gallery = gallery
            guard let galleryData  = (gallery?.data.filter{$0.images.count > 0})else {return}
            for data in galleryData {
                for image in data.images {
                    if !image.animated {
                        galleryImages.append(image)
                    }
                }
            }
        } else {
            showAlert(title: "", message: "SOMETHING_WENT_WRONG".localized(), viewController: self, closure: nil)
            return
        }
    }
    
    func filterWith(section : String, showViral : Bool) {
        getGallery(withSection: section, showViral: showViral) { [unowned self] succeeded, response in
            if succeeded {
                guard let gallery = response as? ImgurRoot else {return}
                self.loadData(WithGallery: gallery)
            }
        }
    }
    
    // MARK: IBActions
    @IBAction func layoutChanged(_ sender: Any) {
        applyGridLayout()
    }
    
    @IBAction func filterAction(_ sender: Any) {
        let alert = UIAlertController(title: "SELECT".localized(), message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "HOT".localized(), style: .default , handler:{ [unowned self] (UIAlertAction) in
            
            self.selectedSection = ImgurFilterSections.hot.rawValue
            self.filterWith(section: self.selectedSection, showViral: self.viralSwitch.isOn)
        }))
        
        alert.addAction(UIAlertAction(title: "TOP".localized(), style: .default , handler:{ [unowned self] (UIAlertAction) in
            
            self.selectedSection = ImgurFilterSections.top.rawValue
            self.filterWith(section: self.selectedSection, showViral: self.viralSwitch.isOn)
        }))
        
        alert.addAction(UIAlertAction(title: "CANCEL".localized(), style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showViralAction(_ sender: Any) {
        filterWith(section: self.selectedSection, showViral: self.viralSwitch.isOn)
    }
    
    @IBAction func aboutAction(_ sender: Any) {
        guard let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController else {fatalError()}
        self.navigationController?.pushViewController(aboutViewController, animated: true)
    }
}
