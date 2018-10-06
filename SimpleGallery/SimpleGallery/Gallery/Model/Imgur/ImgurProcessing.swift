//
//	ImgurProcessing.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurProcessing : NSObject, NSCoding{

	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
