//
//	ImgurDescriptionAnnotation.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurDescriptionAnnotation : NSObject, NSCoding{



	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        let dictionary = [String:Any]()
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{

	}

}
