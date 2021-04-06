//
//  DetailViewController.swift
//  youtube-oneDayBuild
//
//  Created by Media Davarkhah on 8/20/1399 AP.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    var video: Video?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if video == nil {
            return
        }
        // get embeded url
        let embededUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        // set it to webview
        let url = URL(string: embededUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // set title
        titleLabel.text = video!.title
        
        // set date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: video!.published)
        
        textView.text = video!.decription
        
    }


}
