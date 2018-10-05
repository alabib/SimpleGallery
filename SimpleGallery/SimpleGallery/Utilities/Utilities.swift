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

func setImageOfUrlStr(str:String, imageV:UIImageView)
{
    if let url = URL(string: str)
    {
        let resource = ImageResource(downloadURL: url, cacheKey: nil)
        imageV.kf.indicatorType = .activity
        imageV.kf.setImage(with: resource, placeholder: UIImage(named: "gallery-image-placeholder"), options: [.transition(ImageTransition.fade(0.5))], progressBlock: nil, completionHandler: nil)
    }
}
