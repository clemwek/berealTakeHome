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
                             user: "currentUser",
                             story: "",
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
                .frame(width: 30, height: 30, alignment: .bottomTrailing)
            }
            .padding(.bottom, 50)
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
