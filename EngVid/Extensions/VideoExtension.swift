//
//  VideoExtension.swift
//  EngVid
//
//  Created by Arsen Gasparyan on 03/02/15.
//  Copyright (c) 2015 Arsen Gasparyan. All rights reserved.
//

import Foundation
import Runes
import Argo

extension Video: JSONDecodable {
  static func create(external_id: Int)(token: String)(author: String)(title: String)(tags: [String]) -> Video {
    return Video(id: external_id, token: token, author: author, title: title, tags: tags)
  }
  
  static func decode(j: JSONValue) -> Video? {
    return Video.create
      <^> j <| "external_id"
      <*> j <| "token"
      <*> j <| "author"
      <*> j <| "title"
      <*> j <|| "tags"
  }
}