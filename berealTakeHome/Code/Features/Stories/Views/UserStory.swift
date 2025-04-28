//
//  UserStory.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct UserStory: View {
  let story: StoryModel?
  let viewModel: StoriesViewModel

  var body: some View {
    VStack {
      NavigationLink(destination: StoryDetailScreen(story: story)) {

        Image(story?.image ?? "person.circle")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .scaledToFit()
          .frame(width: 60, height: 60)
          .clipShape(.circle)
          .overlay(Circle().stroke(
            story?.story.seen ?? false ? Color.green : Color.white,
            lineWidth: 5))
          .shadow(radius: 2)
          .toolbar(.hidden, for: .tabBar)
      }

      Text(story?.user ?? "StoryScreen.addUserStory".localized)
        .font(.caption)
    }
  }
}

#Preview {
  let story = Story(id: 1,
                    story: "the story",
                    seen: true,
                    liked: false)

  UserStory(
    story: (.init(
            id: 1,
            image: "ava1",
            user: "Jane Doe",
            story: story,
            createdAt: "2025-04-01T10:00:00Z",
            updatedAt: "2025-04-01T12:00:00Z"
          ),
    ), viewModel: StoriesViewModel()
  )
}
