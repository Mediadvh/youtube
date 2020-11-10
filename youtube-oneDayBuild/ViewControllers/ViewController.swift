//
//  ViewController.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/11/1399 AP.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var videos = [Video]()
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set itself to tableView datasource
        tableView.dataSource = self
        
        // set itself to model delegate
        model.delegate = self
        
        
        model.getVideos()
        
    }
    
    


}

extension ViewController: UITableViewDataSource, ModelDelegate{
   
    func videosFetched(_ videos: [Video]?) {
        self.videos = videos!
        
        // reload data
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEO_CELL, for: indexPath) as! VideoTableViewCell
        
        // configure the cell
        let video = videos[indexPath.row]
        cell.configureCell(video)
        
        return cell
    }
    
    
}
