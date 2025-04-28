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
    VStack {
      Image(story?.story.story ?? "r1")
        .edgesIgnoringSafeArea(.top)
      HStack {
        Image(systemName: "heart")
          .resizable()
          .frame(width: 40, height: 40)
          .padding(.bottom, 60)
      }
    }
  }
}

#Preview {
  StoryDetailScreen(story: StoryModel(id: 1,
                                      image: "avatar6",
                                      user: "user2",
                                      story: Story(id: 1,
                                                   story: "r9",
                                                   status: true),
                                      createdAt: "2025-04-04T09:15:00Z",
                                      updatedAt: "2025-04-04T09:15:00Z"))
}
