//
//  Video.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 02/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import Foundation

struct Video {
  let id: Int
  let token: String
  let author: String
  let title: String
  let tags: [String]
  var cover: NSURL {
    get {
      return NSURL(string: "http://i.ytimg.com/vi/\(self.token)/mqdefault.jpg")!
    }
  }
}