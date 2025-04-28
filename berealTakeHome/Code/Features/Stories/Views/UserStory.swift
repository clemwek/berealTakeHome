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
      Image(story?.image ?? "person.circle")
        .resizable()
        .frame(width: 100, height: 100)
        .padding(25)
        .clipShape(.circle)
        .overlay(Circle().stroke(Color.white, lineWidth: 5))
        .shadow(radius: 10)

      Text(story?.user ?? "StoryScreen.addUserStory".localized)
        .font(.title)
    }
  }
}

#Preview {
  UserStory(
    story: .init(
            id: 1,
            image: "avatar1",
            user: "Jane Doe",
            story: "Hello!",
            createdAt: "2025-04-01T10:00:00Z",
            updatedAt: "2025-04-01T12:00:00Z"
          )
  )
}
