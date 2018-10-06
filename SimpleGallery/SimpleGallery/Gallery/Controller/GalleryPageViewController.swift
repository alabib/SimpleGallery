//
//  GalleryPageViewController.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/30/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import SVProgressHUD

enum LayoutSegue : String {
    case grid = "Grid"
    case list = "List"
    case None = ""
}

enum ImgurFilterSections : String {
    case hot = "hot"
    case top = "top"
    case None = ""
}

// MARK: - GalleryPageViewControllerSegue

class GalleryPageViewControllerSegue : UIStoryboardSegue {
    
    // You have to override the perform method so as not to crash
    
    override func perform() {
        
    }
}

class GalleryPageViewController: UIPageViewController {
    
    var stationContainerViewController : GalleryContainerViewController!
    var listViewController : GalleryListViewController!
    var gridViewController : GalleryGridViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        navigationItem.title = "GALLERY".localized()
        for subView in self.view.subviews {
            if subView is UIScrollView {
                
                (subView as! UIScrollView).isScrollEnabled = false
            }
        }
        getGallery(withSection: ImgurFilterSections.top.rawValue, showViral: true) { succeeded, response in
            if succeeded {
                
                guard let gallery = response as? ImgurRoot else {return}
                
                if self.listViewController == nil {
                    self.performSegue(withIdentifier: LayoutSegue.list.rawValue, sender: gallery)
                }
                
                if self.gridViewController == nil {
                    self.performSegue(withIdentifier: LayoutSegue.grid.rawValue, sender: gallery)
                }
            }
        }
    }
    
    private func getGallery(withSection section: String, showViral: Bool, completion: @escaping (Bool, Any?) -> Void) {
        
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        stationContainerViewController = self.parent as? GalleryContainerViewController
        stationContainerViewController.switchView = {
            
            let viewController : GalleryParentViewController! = self.viewControllers![0] == self.listViewController ? self.gridViewController : self.listViewController
            let direction : NavigationDirection = viewController == self.listViewController ? .reverse : .forward;
            self.setViewControllers([viewController], direction: direction, animated: true, completion: nil)
        }
        
        stationContainerViewController.filterWith = { section, showViral in
            self.getGallery(withSection: section, showViral: showViral) { succeeded, response in
                if succeeded {
                    
                    guard let gallery = response as? ImgurRoot else {return}
                    
                    if self.listViewController != nil {
                        self.listViewController.prepareDataSource(WithGallery: gallery)
                        self.listViewController.loadData()
                    }
                    
                    if self.gridViewController != nil {
                        self.gridViewController.prepareDataSource(WithGallery: gallery)
                        self.gridViewController.loadData()
                    }
                }
            }
        }
        
        if segue.identifier == LayoutSegue.list.rawValue {
            self.listViewController = segue.destination as? GalleryListViewController
            self.listViewController.prepareDataSource(WithGallery: sender as? ImgurRoot)
            self.setViewControllers([self.listViewController], direction: .forward, animated: false, completion: nil)
        }
        
        if segue.identifier == LayoutSegue.grid.rawValue {
            self.gridViewController = segue.destination as? GalleryGridViewController
            self.gridViewController.prepareDataSource(WithGallery: sender as? ImgurRoot)
        }
    }
}

// MARK: - UIPageViewControllerDataSource

extension GalleryPageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        return viewController == self.gridViewController ? self.listViewController : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        return viewController == self.listViewController ? self.gridViewController : nil
    }
    
}
