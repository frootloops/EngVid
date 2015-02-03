//
//  VideoViewController.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 02/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import UIKit
import Alamofire
import Argo

class VideoViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var videoTableView: UITableView!
  var videos = Array<Video>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadVideos()
  }
    
  // MARK: - Table View
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Video", forIndexPath: indexPath) as UITableViewCell
    
    let object = videos[indexPath.row] as Video
    cell.textLabel!.text = object.title
    return cell
  }
  
  // MARK: - Data source
 
  func loadVideos() {
    Alamofire.request(.GET, "https://engvid.herokuapp.com/api/videos")
      .responseJSON { (_, _, JSON, _) in
        let documents = JSON!.valueForKey("documents") as [NSDictionary]
        self.videos += documents.map { Video.decode(JSONValue.parse($0))! }
        self.videoTableView.reloadData()
    }
  }
}