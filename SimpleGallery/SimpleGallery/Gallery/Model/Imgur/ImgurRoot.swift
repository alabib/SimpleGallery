//
//	ImgurRoot.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurRoot : NSObject, NSCoding{

	var data : [ImgurData]!
	var status : Int!
	var success : Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		data = [ImgurData]()
		if let dataArray = dictionary["data"] as? [[String:Any]]{
			for dic in dataArray{
				let value = ImgurData(fromDictionary: dic)
				data.append(value)
			}
		}
		status = dictionary["status"] as? Int
		success = dictionary["success"] as? Bool
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if data != nil{
			var dictionaryElements = [[String:Any]]()
			for dataElement in data {
				dictionaryElements.append(dataElement.toDictionary())
			}
			dictionary["data"] = dictionaryElements
		}
		if status != nil{
			dictionary["status"] = status
		}
		if success != nil{
			dictionary["success"] = success
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObject(forKey :"data") as? [ImgurData]
         status = aDecoder.decodeObject(forKey: "status") as? Int
         success = aDecoder.decodeObject(forKey: "success") as? Bool

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encode(data, forKey: "data")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if success != nil{
			aCoder.encode(success, forKey: "success")
		}

	}

}
