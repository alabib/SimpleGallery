//
//  GalleryContainerViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import SVProgressHUD

enum LayoutType : String {
    case gridLayout = "gridLayout"
    case listLayout = "listLayout"
}

enum LayoutSegue : String {
    case grid = "Grid"
    case list = "List"
}

enum ImgurFilterSections : String {
    case hot = "hot"
    case top = "top"
}

class GalleryContainerViewController: UIViewController {
    
    @IBOutlet weak var layoutSegmentedControl: UISegmentedControl!
    @IBOutlet weak var viralSwitch: UISwitch!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let gridFlowLayout = GridFlowLayout()
    let listFlowLayout = ListFlowLayout()
    
    var gallery : ImgurRoot?
    var galleryImages = [ImgurImage]()
    private var selectedSection = ImgurFilterSections.hot.rawValue
    let collectionViewCellIdentifier = "GalleryCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "GALLERY".localized()
        self.layoutSegmentedControl.setTitle("LIST".localized(), forSegmentAt: 0)
        self.layoutSegmentedControl.setTitle("GRID".localized(), forSegmentAt: 1)
        
        collectionView.register(UINib.init(nibName: collectionViewCellIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        applyGridLayout()
        NotificationCenter.default.addObserver(self, selector: #selector(applyGridLayout), name: UIDevice.orientationDidChangeNotification, object: nil)
        collectionView.dataSource = self
        
        getGallery(withSection: ImgurFilterSections.top.rawValue, showViral: true) { [weak self] succeeded, response in
            if succeeded {
                
                guard let gallery = response as? ImgurRoot else {return}
                self?.prepareDataSource(WithGallery: gallery)
                self?.loadData()
            }
        }
        collectionView.reloadData()
    }
    
    
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
    
    func loadData() {
        guard let collectionView = collectionView else { return }
        collectionView.reloadData()
    }
    
    @objc func applyGridLayout() {
        UIView.animate(withDuration: 0.2) { [weak self] () -> Void in
            self?.collectionView.collectionViewLayout.invalidateLayout()
            
            guard let listFlowLayout = self?.listFlowLayout else {return}
            guard let gridFlowLayout = self?.gridFlowLayout else {return}
            switch self?.layoutSegmentedControl.selectedSegmentIndex {
            case 0:
                self?.collectionView.setCollectionViewLayout(listFlowLayout, animated: true)
            case 1:
                self?.collectionView.setCollectionViewLayout(gridFlowLayout, animated: true)
            case .none:
                fatalError()
            case .some(_):
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
        getGallery(withSection: section, showViral: showViral) { [weak self] succeeded, response in
            if succeeded {
                guard let gallery = response as? ImgurRoot else {return}
                self?.prepareDataSource(WithGallery: gallery)
                self?.loadData()
            }
        }
    }
    
    
    @IBAction func layoutChanged(_ sender: Any) {
            applyGridLayout()
    }
    
    @IBAction func filterAction(_ sender: Any) {
        let alert = UIAlertController(title: "Select", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Hot", style: .default , handler:{ [weak self] (UIAlertAction)in
            self?.selectedSection = ImgurFilterSections.hot.rawValue
            self?.filterWith(section: self?.selectedSection ?? ImgurFilterSections.hot.rawValue, showViral: self?.viralSwitch.isOn ?? false)
            
        }))
        alert.addAction(UIAlertAction(title: "Top", style: .default , handler:{ [weak self] (UIAlertAction)in
            self?.selectedSection = ImgurFilterSections.top.rawValue
            self?.filterWith(section: self?.selectedSection ?? ImgurFilterSections.top.rawValue, showViral: self?.viralSwitch.isOn ?? false)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
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

extension GalleryContainerViewController: UICollectionViewDataSource {
    
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
