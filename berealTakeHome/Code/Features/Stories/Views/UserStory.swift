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

  @State private var showStory: Bool = false

  var body: some View {
    VStack {
      NavigationLink(
        destination: StoryDetailScreen(viewModel: viewModel, story: story),
        isActive: $showStory) {
          EmptyView()
        }
        .hidden()

      VStack {
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
          .onTapGesture {
            showStory = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
              showStory = false
            }
          }
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
