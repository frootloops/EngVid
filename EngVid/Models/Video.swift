//
//  Video.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 02/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import Runes
import Argo
import Foundation

struct Video: JSONDecodable {
  let id: Int
  let token: String
  let author: String
  let title: String
  let tags: [String]
    
  static func create(id: Int)(token: String)(author: String)(title: String)(tags: [String]) -> Video {
    return Video(id: id, token: token, author: author, title: title, tags: tags)
  }
  
  static func decode(j: JSONValue) -> Video? {
    return Video.create
      <^> j <| "_id"
      <*> j <| "token"
      <*> j <| "author"
      <*> j <| "title"
      <*> j <|| "tags"
  }
}