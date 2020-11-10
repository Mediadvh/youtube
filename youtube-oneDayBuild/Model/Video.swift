//
//  Video.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/11/1399 AP.
//

import Foundation
struct Video: Decodable{
    
    var videoId = ""
    var title = ""
    var decription = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum codingKeys:String,CodingKey{
        // when an enum conforms to codingkey we can later access the cases by forkey
        case snippet
        case published = "publishedAt"
        case title
        case description
        case high
        case thumbnails
        case resourceId
        
        case thumbnail = "url"
        case videoId
        
    }
    init(from decoder: Decoder) throws {
        
        // get the items ???
        let container = try decoder.container(keyedBy: codingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: codingKeys.self, forKey: .snippet)
        
        // parse publishedAt
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        // parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        // parse description
        self.decription = try snippetContainer.decode(String.self, forKey: .description)
        // get thumbnail container
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .thumbnails)
        // get the high object
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .high)
        
        // parse thumbnail
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // get resource object
        let resourceContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .resourceId)
        // parse videoId
        self.videoId = try resourceContainer.decode(String.self, forKey: .videoId)
        
        
        
        
    }
    
}
