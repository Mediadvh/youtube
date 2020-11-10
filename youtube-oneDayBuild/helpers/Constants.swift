//
//  Constants.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/11/1399 AP.
//

import Foundation
struct Constants{
    
    static var API_KEY = "AIzaSyDJc5OewtusM_j3Rnknd77DC8QQZkUIESk"
    static var PLAYLIST_ID = "PLNHYaYAX3ras62mictnpMptdQ7oQsjZLm"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=19&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEO_CELL = "Video Cell"
    static var Y_EMBEDED_URL = "www.youtube/embeded"
   
}
