//
//  StoryDetailScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoryDetailScreen: View {
  var story: StoryModel?

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  StoryDetailScreen(story: StoryModel(id: 1,
                                      image: "avatar6",
                                      user: "user2",
                                      story: Story(id: 1,
                                                   story: "test story",
                                                   status: true),
                                      createdAt: "2025-04-04T09:15:00Z",
                                      updatedAt: "2025-04-04T09:15:00Z"))
}
