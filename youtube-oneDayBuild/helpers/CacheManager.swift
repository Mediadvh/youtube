//
//  CacheManager.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/20/1399 AP.
//

import Foundation
class CacheManager{
    
    static var cache = [String:Data]()
    static func getVideoCache(_ url : String) -> Data?{
        return cache[url]
    }
    static func setVideoCache(_ url: String,_ data:Data?){
        cache[url] = data
    }
}
