//
//  Model.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/11/1399 AP.
//

import Foundation
protocol ModelDelegate {
    func videosFetched(_ videos:[Video]?)
}
class Model{
    
    var delegate: ModelDelegate?
    func getVideos(){
        
        // Creat URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // check if there,s any errors
            if error != nil || data == nil{
                return
            }
            
            do{
                // Parsing the data into Video objects
                
                let decoder = JSONDecoder()
                // for converting publishedAt
                decoder.dateDecodingStrategy = .iso8601
                
               let response = try decoder.decode(Response.self, from: data!)
                DispatchQueue.main.async {
                    self.delegate?.videosFetched(response.items)
                }
               
                // output everything into the console
//              dump(response)
            }
            catch{
                return
            }
            
        }
        // Kick off the data task
        dataTask.resume()
    }
}
