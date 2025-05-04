//
//  StoryItem.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

struct Story: Identifiable, Codable {

  let id: Int
  let story: String
  var seen: Bool
  var liked: Bool
}
