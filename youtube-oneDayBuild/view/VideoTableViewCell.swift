//
//  VideoTableViewCell.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/17/1399 AP.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var video : Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ VIDEO: Video){
        
        // Make sure we have a video
        self.video = VIDEO
        guard self.video != nil else {
            return
            
        }
        // set title
         self.titleLabel.text = self.video?.title
         
         // set date
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
         self.dateLabel.text = dateFormatter.string(from: self.video!.published)
        
        // TODO: check if its already in video chache
        if let cachedVideo = CacheManager.getVideoCache(self.video!.thumbnail){
            self.imageThumbnail.image = UIImage(data: cachedVideo)
            
        }
        // get the url
        guard self.video?.thumbnail != "" else {
            return
        }
        let url = URL(string: self.video!.thumbnail)
        // get the url shared session
        let session = URLSession.shared
        // set data task
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
           
        
            // check if there's no error and there's data
            if error == nil && data != nil{
                // check if the url is the url we want
                guard let urlString = url?.absoluteString, urlString == self.video?.thumbnail else {
                    // video has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //TODO: save the data to video cache
                CacheManager.setVideoCache(urlString, data)
                
               
                
                // get image
                let image = UIImage(data: data!)
                
                // set image
                DispatchQueue.main.async {
                    self.imageThumbnail.image = image
                    
                   
                }
               
               
        }
        
    }
        // resume data task
        dataTask.resume()
        
}
}
