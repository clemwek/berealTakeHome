//
//  UserStory.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct UserStory: View {
  let story: StoryModel?

  var body: some View {
    VStack {
      NavigationLink(destination: StoryDetailScreen(story: story)) {

        Image(story?.image ?? "person.circle")
          .resizable()
          .frame(width: 60, height: 60)
          .padding(25)
          .clipShape(.circle)
          .overlay(Circle().stroke(
            story?.story.status ?? false ? Color.green : Color.white,
            lineWidth: 5))
          .shadow(radius: 10)
          .toolbar(.hidden, for: .tabBar)
      }

      Text(story?.user ?? "StoryScreen.addUserStory".localized)
        .font(.title)
    }
  }
}

#Preview {
  let story = Story(id: 1,
                        story: "the story",
                        status: true)
  UserStory(
    story: .init(
            id: 1,
            image: "avatar1",
            user: "Jane Doe",
            story: story,
            createdAt: "2025-04-01T10:00:00Z",
            updatedAt: "2025-04-01T12:00:00Z"
          )
  )
}
