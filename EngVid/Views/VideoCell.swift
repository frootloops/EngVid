//
//  VideoCell.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 03/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var tags: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
