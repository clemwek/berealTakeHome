//
//  StoryModel.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

struct StoryModel: Identifiable, Codable {

  let id: Int
  let image: String
  let user: String
  var story: Story
  let createdAt: String
  let updatedAt: String
}
