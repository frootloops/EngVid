//
//  Watch.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 08/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController {
  @IBOutlet weak var web: UIWebView!
  var video: Video!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    web.mediaPlaybackRequiresUserAction = false
    view.clipsToBounds = true
    web.loadRequest(NSURLRequest(URL: NSURL(string: "http://m.youtube.com/watch?v=\(video.token)&autoplay=1&hd=1")!))
    
     NSNotificationCenter.defaultCenter().addObserver(self, selector: "playbackStateDidChange:", name: UIWindowDidBecomeHiddenNotification, object: nil)
  }
    
  func playbackStateDidChange(sender : AnyObject) {
    self.navigationController?.popToRootViewControllerAnimated(true)
  }
}