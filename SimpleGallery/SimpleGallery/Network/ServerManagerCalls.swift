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
    func getGalleryWith(section:String, showViral: Bool)
    {
        httpConnect(resource: ImgurRoot.resourceForGalleryWith(section:section, showViral: showViral), paramters: nil, complation:
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
