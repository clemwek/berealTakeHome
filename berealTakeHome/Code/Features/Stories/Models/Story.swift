//
//  StoryItem.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

struct Story: Identifiable, Codable {

  let id: Int
  let story: String
  let seen: Bool
  let liked: Bool
}
