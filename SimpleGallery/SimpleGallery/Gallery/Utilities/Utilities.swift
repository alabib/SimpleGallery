//
//  AppMethods.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/29/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit
import Localize_Swift
import Kingfisher

enum Language : String {
    case English = "en"
    case German = "de"
    case None = ""
}


func showAlert(title:String, message:String, viewController:UIViewController, closure:(()->())?)
{
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK".localized(), style: .default)
    { (result : UIAlertAction) -> Void in
        closure?()
    }
    alertController.addAction(okAction)
    viewController.present(alertController, animated: true, completion: nil)
}

func setImageOfUrlStr(str:String, imageV:UIImageView, completionHandler : ((_ image: Image?) -> Void)? = nil)
{
    if let url = URL(string: str)
    {
        let resource = ImageResource(downloadURL: url, cacheKey: nil)
        imageV.kf.indicatorType = .none
        imageV.kf.setImage(with: resource, placeholder: UIImage(named: "gallery-image-placeholder"), options: [.transition(ImageTransition.fade(0.5))], progressBlock: nil){ (image, error, cacheType, url) in
            if let completionHandler = completionHandler {
                completionHandler(image)
            }
        }
        
    }
}

func setupShadowFor(_ view: UIView) {
    view.layer.shadowOpacity = 1
    view.layer.shouldRasterize = true
    view.layer.rasterizationScale = UIScreen.main.scale
    view.layer.shadowColor = UIColor(red: 16/255, green: 6/255, blue: 7/255, alpha: 0.23).cgColor
    view.layer.shadowRadius = 2
    view.layer.shadowOffset = CGSize(width: 0, height: 2)
}


func setupRoundedCornerFor(_ view: UIView) {
    view.layer.cornerRadius = 4
    view.layer.masksToBounds = true
    view.clipsToBounds = true
}
