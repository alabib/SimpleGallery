//
//	ImgurImage.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurImage : NSObject, NSCoding{

	var accountId : AnyObject!
	var accountUrl : AnyObject!
	var adType : Int!
	var adUrl : String!
	var animated : Bool!
	var bandwidth : Int!
	var commentCount : AnyObject!
	var datetime : Int!
	var descriptionField : String!
	var downs : AnyObject!
	var favorite : Bool!
	var favoriteCount : AnyObject!
	var hasSound : Bool!
	var height : Int!
	var id : String!
	var inGallery : Bool!
	var inMostViral : Bool!
	var isAd : Bool!
	var link : String!
	var nsfw : AnyObject!
	var points : AnyObject!
	var score : AnyObject!
	var section : AnyObject!
	var size : Int!
	var tags : [AnyObject]!
	var title : AnyObject!
	var type : String!
	var ups : AnyObject!
	var views : Int!
	var vote : AnyObject!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accountId = dictionary["account_id"] as AnyObject
		accountUrl = dictionary["account_url"] as AnyObject
		adType = dictionary["ad_type"] as? Int
		adUrl = dictionary["ad_url"] as? String
		animated = dictionary["animated"] as? Bool
		bandwidth = dictionary["bandwidth"] as? Int
		commentCount = dictionary["comment_count"] as AnyObject
		datetime = dictionary["datetime"] as? Int
		descriptionField = dictionary["description"] as? String
		downs = dictionary["downs"] as AnyObject
		favorite = dictionary["favorite"] as? Bool
		favoriteCount = dictionary["favorite_count"] as AnyObject
		hasSound = dictionary["has_sound"] as? Bool
		height = dictionary["height"] as? Int
		id = dictionary["id"] as? String
		inGallery = dictionary["in_gallery"] as? Bool
		inMostViral = dictionary["in_most_viral"] as? Bool
		isAd = dictionary["is_ad"] as? Bool
		link = dictionary["link"] as? String
		nsfw = dictionary["nsfw"] as AnyObject
		points = dictionary["points"] as AnyObject
		score = dictionary["score"] as AnyObject
		section = dictionary["section"] as AnyObject
		size = dictionary["size"] as? Int
		tags = dictionary["tags"] as? [AnyObject]
		title = dictionary["title"] as AnyObject
		type = dictionary["type"] as? String
		ups = dictionary["ups"] as AnyObject
		views = dictionary["views"] as? Int
		vote = dictionary["vote"] as AnyObject
		width = dictionary["width"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if accountId != nil{
			dictionary["account_id"] = accountId
		}
		if accountUrl != nil{
			dictionary["account_url"] = accountUrl
		}
		if adType != nil{
			dictionary["ad_type"] = adType
		}
		if adUrl != nil{
			dictionary["ad_url"] = adUrl
		}
		if animated != nil{
			dictionary["animated"] = animated
		}
		if bandwidth != nil{
			dictionary["bandwidth"] = bandwidth
		}
		if commentCount != nil{
			dictionary["comment_count"] = commentCount
		}
		if datetime != nil{
			dictionary["datetime"] = datetime
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if downs != nil{
			dictionary["downs"] = downs
		}
		if favorite != nil{
			dictionary["favorite"] = favorite
		}
		if favoriteCount != nil{
			dictionary["favorite_count"] = favoriteCount
		}
		if hasSound != nil{
			dictionary["has_sound"] = hasSound
		}
		if height != nil{
			dictionary["height"] = height
		}
		if id != nil{
			dictionary["id"] = id
		}
		if inGallery != nil{
			dictionary["in_gallery"] = inGallery
		}
		if inMostViral != nil{
			dictionary["in_most_viral"] = inMostViral
		}
		if isAd != nil{
			dictionary["is_ad"] = isAd
		}
		if link != nil{
			dictionary["link"] = link
		}
		if nsfw != nil{
			dictionary["nsfw"] = nsfw
		}
		if points != nil{
			dictionary["points"] = points
		}
		if score != nil{
			dictionary["score"] = score
		}
		if section != nil{
			dictionary["section"] = section
		}
		if size != nil{
			dictionary["size"] = size
		}
		if tags != nil{
			dictionary["tags"] = tags
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if ups != nil{
			dictionary["ups"] = ups
		}
		if views != nil{
			dictionary["views"] = views
		}
		if vote != nil{
			dictionary["vote"] = vote
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accountId = aDecoder.decodeObject(forKey: "account_id") as AnyObject
         accountUrl = aDecoder.decodeObject(forKey: "account_url") as AnyObject
         adType = aDecoder.decodeObject(forKey: "ad_type") as? Int
         adUrl = aDecoder.decodeObject(forKey: "ad_url") as? String
         animated = aDecoder.decodeObject(forKey: "animated") as? Bool
         bandwidth = aDecoder.decodeObject(forKey: "bandwidth") as? Int
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as AnyObject
         datetime = aDecoder.decodeObject(forKey: "datetime") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         downs = aDecoder.decodeObject(forKey: "downs") as AnyObject
         favorite = aDecoder.decodeObject(forKey: "favorite") as? Bool
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as AnyObject
         hasSound = aDecoder.decodeObject(forKey: "has_sound") as? Bool
         height = aDecoder.decodeObject(forKey: "height") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? String
         inGallery = aDecoder.decodeObject(forKey: "in_gallery") as? Bool
         inMostViral = aDecoder.decodeObject(forKey: "in_most_viral") as? Bool
         isAd = aDecoder.decodeObject(forKey: "is_ad") as? Bool
         link = aDecoder.decodeObject(forKey: "link") as? String
         nsfw = aDecoder.decodeObject(forKey: "nsfw") as AnyObject
         points = aDecoder.decodeObject(forKey: "points") as AnyObject
         score = aDecoder.decodeObject(forKey: "score") as AnyObject
         section = aDecoder.decodeObject(forKey: "section") as AnyObject
         size = aDecoder.decodeObject(forKey: "size") as? Int
         tags = aDecoder.decodeObject(forKey: "tags") as? [AnyObject]
         title = aDecoder.decodeObject(forKey: "title") as AnyObject
         type = aDecoder.decodeObject(forKey: "type") as? String
         ups = aDecoder.decodeObject(forKey: "ups") as AnyObject
         views = aDecoder.decodeObject(forKey: "views") as? Int
         vote = aDecoder.decodeObject(forKey: "vote") as AnyObject
         width = aDecoder.decodeObject(forKey: "width") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accountId != nil{
			aCoder.encode(accountId, forKey: "account_id")
		}
		if accountUrl != nil{
			aCoder.encode(accountUrl, forKey: "account_url")
		}
		if adType != nil{
			aCoder.encode(adType, forKey: "ad_type")
		}
		if adUrl != nil{
			aCoder.encode(adUrl, forKey: "ad_url")
		}
		if animated != nil{
			aCoder.encode(animated, forKey: "animated")
		}
		if bandwidth != nil{
			aCoder.encode(bandwidth, forKey: "bandwidth")
		}
		if commentCount != nil{
			aCoder.encode(commentCount, forKey: "comment_count")
		}
		if datetime != nil{
			aCoder.encode(datetime, forKey: "datetime")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if downs != nil{
			aCoder.encode(downs, forKey: "downs")
		}
		if favorite != nil{
			aCoder.encode(favorite, forKey: "favorite")
		}
		if favoriteCount != nil{
			aCoder.encode(favoriteCount, forKey: "favorite_count")
		}
		if hasSound != nil{
			aCoder.encode(hasSound, forKey: "has_sound")
		}
		if height != nil{
			aCoder.encode(height, forKey: "height")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if inGallery != nil{
			aCoder.encode(inGallery, forKey: "in_gallery")
		}
		if inMostViral != nil{
			aCoder.encode(inMostViral, forKey: "in_most_viral")
		}
		if isAd != nil{
			aCoder.encode(isAd, forKey: "is_ad")
		}
		if link != nil{
			aCoder.encode(link, forKey: "link")
		}
		if nsfw != nil{
			aCoder.encode(nsfw, forKey: "nsfw")
		}
		if points != nil{
			aCoder.encode(points, forKey: "points")
		}
		if score != nil{
			aCoder.encode(score, forKey: "score")
		}
		if section != nil{
			aCoder.encode(section, forKey: "section")
		}
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}
		if tags != nil{
			aCoder.encode(tags, forKey: "tags")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if ups != nil{
			aCoder.encode(ups, forKey: "ups")
		}
		if views != nil{
			aCoder.encode(views, forKey: "views")
		}
		if vote != nil{
			aCoder.encode(vote, forKey: "vote")
		}
		if width != nil{
			aCoder.encode(width, forKey: "width")
		}

	}

}
