//
//	ImgurTag.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurTag : NSObject, NSCoding{

	var accent : String!
	var backgroundHash : String!
	var backgroundIsAnimated : Bool!
	var descriptionField : String!
	var descriptionAnnotations : ImgurDescriptionAnnotation!
	var displayName : String!
	var followers : Int!
	var following : Bool!
	var isPromoted : Bool!
	var logoDestinationUrl : AnyObject!
	var logoHash : AnyObject!
	var name : String!
	var thumbnailHash : AnyObject!
	var thumbnailIsAnimated : Bool!
	var totalItems : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accent = dictionary["accent"] as? String
		backgroundHash = dictionary["background_hash"] as? String
		backgroundIsAnimated = dictionary["background_is_animated"] as? Bool
		descriptionField = dictionary["description"] as? String
		if let descriptionAnnotationsData = dictionary["description_annotations"] as? [String:Any]{
			descriptionAnnotations = ImgurDescriptionAnnotation(fromDictionary: descriptionAnnotationsData)
		}
		displayName = dictionary["display_name"] as? String
		followers = dictionary["followers"] as? Int
		following = dictionary["following"] as? Bool
		isPromoted = dictionary["is_promoted"] as? Bool
		logoDestinationUrl = dictionary["logo_destination_url"] as AnyObject
		logoHash = dictionary["logo_hash"] as AnyObject
		name = dictionary["name"] as? String
		thumbnailHash = dictionary["thumbnail_hash"] as AnyObject
		thumbnailIsAnimated = dictionary["thumbnail_is_animated"] as? Bool
		totalItems = dictionary["total_items"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accent != nil{
			dictionary["accent"] = accent
		}
		if backgroundHash != nil{
			dictionary["background_hash"] = backgroundHash
		}
		if backgroundIsAnimated != nil{
			dictionary["background_is_animated"] = backgroundIsAnimated
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if descriptionAnnotations != nil{
			dictionary["description_annotations"] = descriptionAnnotations.toDictionary()
		}
		if displayName != nil{
			dictionary["display_name"] = displayName
		}
		if followers != nil{
			dictionary["followers"] = followers
		}
		if following != nil{
			dictionary["following"] = following
		}
		if isPromoted != nil{
			dictionary["is_promoted"] = isPromoted
		}
		if logoDestinationUrl != nil{
			dictionary["logo_destination_url"] = logoDestinationUrl
		}
		if logoHash != nil{
			dictionary["logo_hash"] = logoHash
		}
		if name != nil{
			dictionary["name"] = name
		}
		if thumbnailHash != nil{
			dictionary["thumbnail_hash"] = thumbnailHash
		}
		if thumbnailIsAnimated != nil{
			dictionary["thumbnail_is_animated"] = thumbnailIsAnimated
		}
		if totalItems != nil{
			dictionary["total_items"] = totalItems
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accent = aDecoder.decodeObject(forKey: "accent") as? String
         backgroundHash = aDecoder.decodeObject(forKey: "background_hash") as? String
         backgroundIsAnimated = aDecoder.decodeObject(forKey: "background_is_animated") as? Bool
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         descriptionAnnotations = aDecoder.decodeObject(forKey: "description_annotations") as? ImgurDescriptionAnnotation
         displayName = aDecoder.decodeObject(forKey: "display_name") as? String
         followers = aDecoder.decodeObject(forKey: "followers") as? Int
         following = aDecoder.decodeObject(forKey: "following") as? Bool
         isPromoted = aDecoder.decodeObject(forKey: "is_promoted") as? Bool
         logoDestinationUrl = aDecoder.decodeObject(forKey: "logo_destination_url") as AnyObject
         logoHash = aDecoder.decodeObject(forKey: "logo_hash") as AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? String
         thumbnailHash = aDecoder.decodeObject(forKey: "thumbnail_hash") as AnyObject
         thumbnailIsAnimated = aDecoder.decodeObject(forKey: "thumbnail_is_animated") as? Bool
         totalItems = aDecoder.decodeObject(forKey: "total_items") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accent != nil{
			aCoder.encode(accent, forKey: "accent")
		}
		if backgroundHash != nil{
			aCoder.encode(backgroundHash, forKey: "background_hash")
		}
		if backgroundIsAnimated != nil{
			aCoder.encode(backgroundIsAnimated, forKey: "background_is_animated")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if descriptionAnnotations != nil{
			aCoder.encode(descriptionAnnotations, forKey: "description_annotations")
		}
		if displayName != nil{
			aCoder.encode(displayName, forKey: "display_name")
		}
		if followers != nil{
			aCoder.encode(followers, forKey: "followers")
		}
		if following != nil{
			aCoder.encode(following, forKey: "following")
		}
		if isPromoted != nil{
			aCoder.encode(isPromoted, forKey: "is_promoted")
		}
		if logoDestinationUrl != nil{
			aCoder.encode(logoDestinationUrl, forKey: "logo_destination_url")
		}
		if logoHash != nil{
			aCoder.encode(logoHash, forKey: "logo_hash")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if thumbnailHash != nil{
			aCoder.encode(thumbnailHash, forKey: "thumbnail_hash")
		}
		if thumbnailIsAnimated != nil{
			aCoder.encode(thumbnailIsAnimated, forKey: "thumbnail_is_animated")
		}
		if totalItems != nil{
			aCoder.encode(totalItems, forKey: "total_items")
		}

	}

}
