//
//  StoryModel.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

struct StoryModel: Identifiable, Codable {

  let id: Int
  let image: String
  let user: String
  let story: String
  let createdAt: String
  let updatedAt: String
}
