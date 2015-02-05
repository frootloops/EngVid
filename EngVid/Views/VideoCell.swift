//
//  VideoCell.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 03/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import UIKit
import HanekeSwift

class VideoCell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var tags: UILabel!
  @IBOutlet weak var cover: UIImageView!
  
  var video: Video! {
    didSet { fill() }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func fill() {
    title.text = video.title
    tags.text = ", ".join(video.tags)
    cover.hnk_setImageFromURL(video.cover)
  }
}
