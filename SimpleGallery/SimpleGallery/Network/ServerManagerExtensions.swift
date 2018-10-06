//
//  ServerManagerExtensions.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/29/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit

extension ImgurRoot
{
    static var all = Resource<ImgurRoot>(url: "\(GALLERY_URL)", httpmethod: .get)
    { (json) -> ImgurRoot? in
        
        
        if let jsonObj = json as? [String : Any]
        {
            
            let content = ImgurRoot(fromDictionary: jsonObj)
            return content
        }
        return nil
    }
    
    static func resourceForGalleryWith(section:String, showViral: Bool)->Resource<ImgurRoot>
    {
        let url = String(format: GALLERY_URL,section,showViral ? "true" : "false")
        ImgurRoot.all.url = url
        return ImgurRoot.all
    }
}
