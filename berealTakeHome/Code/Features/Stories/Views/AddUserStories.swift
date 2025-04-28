//
//  AddUserStories.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct AddUserStories: View {
  var userStory = StoryModel(id: 1000,
                             image: "user",
                             user: "StoryScreen.addUserStory".localized,
                             story: Story(id: 1,
                                          story: "r5",
                                          seen: true,
                                          liked: false),
                             createdAt: "2025-04-01T10:00:00Z",
                             updatedAt: "2025-04-01T10:00:00Z")

  var body: some View {
    HStack {
      UserStory(story: userStory)
        .overlay {
          VStack {

            Spacer()

            HStack {

              Spacer()

              Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 20, height: 20, alignment: .bottomTrailing)
            }
            .padding(.bottom, 18)
          }
        }

      Spacer()

    }
    .padding()
  }
}

#Preview {
    AddUserStories()
}
