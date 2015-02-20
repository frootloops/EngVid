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

class VideoViewController: UITableViewController, UITableViewDelegate, UISearchBarDelegate {
  @IBOutlet weak var searchBarInput: UISearchBar!
  var app = UIApplication.sharedApplication()
  var videos = [Video]()
  var currentPage = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadVideos()
    searchBarInput.delegate = self
  }
  
  // MARK: - Search

  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    currentPage = 1
    Alamofire.request(.GET, "https://engvid.herokuapp.com/api/videos", parameters: ["page": currentPage, "q": searchBar.text])
      .responseJSON { (_, _, JSON, _) in
        let documents = JSON!.valueForKey("documents") as [NSDictionary]
        self.videos = documents.map { Video.decode(JSONValue.parse($0))! }
        self.tableView.reloadData()
    }
    searchBar.resignFirstResponder()
  }
  
  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    if searchBar.text == ""{
      currentPage = 1
      videos = []
      loadVideos()
      searchBar.resignFirstResponder()
    }
  }


  // MARK: - Segues
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "play" {
      if let indexPath = self.tableView.indexPathForSelectedRow() {
        let video = videos[indexPath.row] as Video
        (segue.destinationViewController as WatchViewController).video = video
      }
    }
  }
  
  @IBAction func refresh(sender: UIRefreshControl) {
    currentPage = 1
    Alamofire.request(.GET, "https://engvid.herokuapp.com/api/videos", parameters: ["page": currentPage])
      .responseJSON { (_, _, JSON, _) in
        let documents = JSON!.valueForKey("documents") as [NSDictionary]
        self.videos = documents.map { Video.decode(JSONValue.parse($0))! }
        self.tableView.reloadData()
        sender.endRefreshing()
    }
  }
  
  // MARK: - Table View
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Video", forIndexPath: indexPath) as VideoCell
    cell.video = videos[indexPath.row] as Video
    return cell
  }
  
  override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    if (indexPath.row == (videos.count - 10)) && !app.networkActivityIndicatorVisible {
      loadVideos()
    }
  }
  
  // MARK: - Data source
 
  func loadVideos() {
    app.networkActivityIndicatorVisible = true
    Alamofire.request(.GET, "https://engvid.herokuapp.com/api/videos", parameters: ["page": currentPage])
      .responseJSON { (_, _, JSON, _) in
        self.currentPage += 1
        let documents = JSON!.valueForKey("documents") as [NSDictionary]
        self.videos += documents.map { Video.decode(JSONValue.parse($0))! }
        self.tableView.reloadData()
        self.app.networkActivityIndicatorVisible = false
    }
  }
}