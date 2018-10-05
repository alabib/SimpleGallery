//
//  ServerManagerCalls.swift
//  SimpleGallery
//
//  Created by Ahmed Labib on 9/29/18.
//  Copyright © 2018 Ahmed Labib. All rights reserved.
//

import UIKit


extension ServerManager
{
    func getGalleryWith(section:String, sortingCriteria: String)
    {
        httpConnect(resource: ImgurRoot.resourceForGalleryWith(section:section, sortingCriteria: sortingCriteria), paramters: nil, complation:
            { (json, data) in
                if let jsonObject = json
                {
                    self.didFinish?(jsonObject as AnyObject?)
                }
        })
        { (error, msg) in
            self.didFinishWithError?(error, msg)
        }
    }
}
