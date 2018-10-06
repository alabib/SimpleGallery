//
//	ImgurData.swift
//  SimpleGallery
//
//	Created by Ahmed Labib on 2/10/18
//	Copyright © 2018 Ahmed Labib. All rights reserved.
//

import Foundation


class ImgurData : NSObject, NSCoding{

	var accountId : Int!
	var accountUrl : String!
	var adType : Int!
	var adUrl : String!
	var animated : Bool!
	var bandwidth : Int!
	var commentCount : Int!
	var cover : String!
	var coverHeight : Int!
	var coverWidth : Int!
	var datetime : Int!
	var descriptionField : AnyObject!
	var downs : Int!
	var favorite : Bool!
	var favoriteCount : Int!
	var gifv : String!
	var hasSound : Bool!
	var height : Int!
	var id : String!
	var images : [ImgurImage]!
	var imagesCount : Int!
	var inGallery : Bool!
	var inMostViral : Bool!
	var includeAlbumAds : Bool!
	var isAd : Bool!
	var isAlbum : Bool!
	var layout : String!
	var link : String!
	var looping : Bool!
	var mp4 : String!
	var mp4Size : Int!
	var nsfw : Bool!
	var points : Int!
	var privacy : String!
	var processing : ImgurProcessing!
	var score : Int!
	var section : String!
	var size : Int!
	var tags : [ImgurTag]!
	var title : String!
	var topic : String!
	var topicId : Int!
	var type : String!
	var ups : Int!
	var views : Int!
	var vote : AnyObject!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		accountId = dictionary["account_id"] as? Int
		accountUrl = dictionary["account_url"] as? String
		adType = dictionary["ad_type"] as? Int
		adUrl = dictionary["ad_url"] as? String
		animated = dictionary["animated"] as? Bool
		bandwidth = dictionary["bandwidth"] as? Int
		commentCount = dictionary["comment_count"] as? Int
		cover = dictionary["cover"] as? String
		coverHeight = dictionary["cover_height"] as? Int
		coverWidth = dictionary["cover_width"] as? Int
		datetime = dictionary["datetime"] as? Int
        descriptionField = dictionary["description"] as AnyObject
		downs = dictionary["downs"] as? Int
		favorite = dictionary["favorite"] as? Bool
		favoriteCount = dictionary["favorite_count"] as? Int
		gifv = dictionary["gifv"] as? String
		hasSound = dictionary["has_sound"] as? Bool
		height = dictionary["height"] as? Int
		id = dictionary["id"] as? String
		images = [ImgurImage]()
		if let imagesArray = dictionary["images"] as? [[String:Any]]{
			for dic in imagesArray{
				let value = ImgurImage(fromDictionary: dic)
				images.append(value)
			}
		}
		imagesCount = dictionary["images_count"] as? Int
		inGallery = dictionary["in_gallery"] as? Bool
		inMostViral = dictionary["in_most_viral"] as? Bool
		includeAlbumAds = dictionary["include_album_ads"] as? Bool
		isAd = dictionary["is_ad"] as? Bool
		isAlbum = dictionary["is_album"] as? Bool
		layout = dictionary["layout"] as? String
		link = dictionary["link"] as? String
		looping = dictionary["looping"] as? Bool
		mp4 = dictionary["mp4"] as? String
		mp4Size = dictionary["mp4_size"] as? Int
		nsfw = dictionary["nsfw"] as? Bool
		points = dictionary["points"] as? Int
		privacy = dictionary["privacy"] as? String
		if let processingData = dictionary["processing"] as? [String:Any]{
			processing = ImgurProcessing(fromDictionary: processingData)
		}
		score = dictionary["score"] as? Int
		section = dictionary["section"] as? String
		size = dictionary["size"] as? Int
		tags = [ImgurTag]()
		if let tagsArray = dictionary["tags"] as? [[String:Any]]{
			for dic in tagsArray{
				let value = ImgurTag(fromDictionary: dic)
				tags.append(value)
			}
		}
		title = dictionary["title"] as? String
		topic = dictionary["topic"] as? String
		topicId = dictionary["topic_id"] as? Int
		type = dictionary["type"] as? String
		ups = dictionary["ups"] as? Int
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
		if cover != nil{
			dictionary["cover"] = cover
		}
		if coverHeight != nil{
			dictionary["cover_height"] = coverHeight
		}
		if coverWidth != nil{
			dictionary["cover_width"] = coverWidth
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
		if gifv != nil{
			dictionary["gifv"] = gifv
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
		if images != nil{
			var dictionaryElements = [[String:Any]]()
			for imagesElement in images {
				dictionaryElements.append(imagesElement.toDictionary())
			}
			dictionary["images"] = dictionaryElements
		}
		if imagesCount != nil{
			dictionary["images_count"] = imagesCount
		}
		if inGallery != nil{
			dictionary["in_gallery"] = inGallery
		}
		if inMostViral != nil{
			dictionary["in_most_viral"] = inMostViral
		}
		if includeAlbumAds != nil{
			dictionary["include_album_ads"] = includeAlbumAds
		}
		if isAd != nil{
			dictionary["is_ad"] = isAd
		}
		if isAlbum != nil{
			dictionary["is_album"] = isAlbum
		}
		if layout != nil{
			dictionary["layout"] = layout
		}
		if link != nil{
			dictionary["link"] = link
		}
		if looping != nil{
			dictionary["looping"] = looping
		}
		if mp4 != nil{
			dictionary["mp4"] = mp4
		}
		if mp4Size != nil{
			dictionary["mp4_size"] = mp4Size
		}
		if nsfw != nil{
			dictionary["nsfw"] = nsfw
		}
		if points != nil{
			dictionary["points"] = points
		}
		if privacy != nil{
			dictionary["privacy"] = privacy
		}
		if processing != nil{
			dictionary["processing"] = processing.toDictionary()
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
			var dictionaryElements = [[String:Any]]()
			for tagsElement in tags {
				dictionaryElements.append(tagsElement.toDictionary())
			}
			dictionary["tags"] = dictionaryElements
		}
		if title != nil{
			dictionary["title"] = title
		}
		if topic != nil{
			dictionary["topic"] = topic
		}
		if topicId != nil{
			dictionary["topic_id"] = topicId
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
         accountId = aDecoder.decodeObject(forKey: "account_id") as? Int
         accountUrl = aDecoder.decodeObject(forKey: "account_url") as? String
         adType = aDecoder.decodeObject(forKey: "ad_type") as? Int
         adUrl = aDecoder.decodeObject(forKey: "ad_url") as? String
         animated = aDecoder.decodeObject(forKey: "animated") as? Bool
         bandwidth = aDecoder.decodeObject(forKey: "bandwidth") as? Int
         commentCount = aDecoder.decodeObject(forKey: "comment_count") as? Int
         cover = aDecoder.decodeObject(forKey: "cover") as? String
         coverHeight = aDecoder.decodeObject(forKey: "cover_height") as? Int
         coverWidth = aDecoder.decodeObject(forKey: "cover_width") as? Int
         datetime = aDecoder.decodeObject(forKey: "datetime") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as AnyObject
         downs = aDecoder.decodeObject(forKey: "downs") as? Int
         favorite = aDecoder.decodeObject(forKey: "favorite") as? Bool
         favoriteCount = aDecoder.decodeObject(forKey: "favorite_count") as? Int
         gifv = aDecoder.decodeObject(forKey: "gifv") as? String
         hasSound = aDecoder.decodeObject(forKey: "has_sound") as? Bool
         height = aDecoder.decodeObject(forKey: "height") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? String
         images = aDecoder.decodeObject(forKey :"images") as? [ImgurImage]
         imagesCount = aDecoder.decodeObject(forKey: "images_count") as? Int
         inGallery = aDecoder.decodeObject(forKey: "in_gallery") as? Bool
         inMostViral = aDecoder.decodeObject(forKey: "in_most_viral") as? Bool
         includeAlbumAds = aDecoder.decodeObject(forKey: "include_album_ads") as? Bool
         isAd = aDecoder.decodeObject(forKey: "is_ad") as? Bool
         isAlbum = aDecoder.decodeObject(forKey: "is_album") as? Bool
         layout = aDecoder.decodeObject(forKey: "layout") as? String
         link = aDecoder.decodeObject(forKey: "link") as? String
         looping = aDecoder.decodeObject(forKey: "looping") as? Bool
         mp4 = aDecoder.decodeObject(forKey: "mp4") as? String
         mp4Size = aDecoder.decodeObject(forKey: "mp4_size") as? Int
         nsfw = aDecoder.decodeObject(forKey: "nsfw") as? Bool
         points = aDecoder.decodeObject(forKey: "points") as? Int
         privacy = aDecoder.decodeObject(forKey: "privacy") as? String
         processing = aDecoder.decodeObject(forKey: "processing") as? ImgurProcessing
         score = aDecoder.decodeObject(forKey: "score") as? Int
         section = aDecoder.decodeObject(forKey: "section") as? String
         size = aDecoder.decodeObject(forKey: "size") as? Int
         tags = aDecoder.decodeObject(forKey :"tags") as? [ImgurTag]
         title = aDecoder.decodeObject(forKey: "title") as? String
         topic = aDecoder.decodeObject(forKey: "topic") as? String
         topicId = aDecoder.decodeObject(forKey: "topic_id") as? Int
         type = aDecoder.decodeObject(forKey: "type") as? String
         ups = aDecoder.decodeObject(forKey: "ups") as? Int
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
		if cover != nil{
			aCoder.encode(cover, forKey: "cover")
		}
		if coverHeight != nil{
			aCoder.encode(coverHeight, forKey: "cover_height")
		}
		if coverWidth != nil{
			aCoder.encode(coverWidth, forKey: "cover_width")
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
		if gifv != nil{
			aCoder.encode(gifv, forKey: "gifv")
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
		if images != nil{
			aCoder.encode(images, forKey: "images")
		}
		if imagesCount != nil{
			aCoder.encode(imagesCount, forKey: "images_count")
		}
		if inGallery != nil{
			aCoder.encode(inGallery, forKey: "in_gallery")
		}
		if inMostViral != nil{
			aCoder.encode(inMostViral, forKey: "in_most_viral")
		}
		if includeAlbumAds != nil{
			aCoder.encode(includeAlbumAds, forKey: "include_album_ads")
		}
		if isAd != nil{
			aCoder.encode(isAd, forKey: "is_ad")
		}
		if isAlbum != nil{
			aCoder.encode(isAlbum, forKey: "is_album")
		}
		if layout != nil{
			aCoder.encode(layout, forKey: "layout")
		}
		if link != nil{
			aCoder.encode(link, forKey: "link")
		}
		if looping != nil{
			aCoder.encode(looping, forKey: "looping")
		}
		if mp4 != nil{
			aCoder.encode(mp4, forKey: "mp4")
		}
		if mp4Size != nil{
			aCoder.encode(mp4Size, forKey: "mp4_size")
		}
		if nsfw != nil{
			aCoder.encode(nsfw, forKey: "nsfw")
		}
		if points != nil{
			aCoder.encode(points, forKey: "points")
		}
		if privacy != nil{
			aCoder.encode(privacy, forKey: "privacy")
		}
		if processing != nil{
			aCoder.encode(processing, forKey: "processing")
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
		if topic != nil{
			aCoder.encode(topic, forKey: "topic")
		}
		if topicId != nil{
			aCoder.encode(topicId, forKey: "topic_id")
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
