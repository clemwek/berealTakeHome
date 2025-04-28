//
//  StoryStrip.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoryStrip: View {

  @ObservedObject var viewModel: StoriesViewModel

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        AddUserStories()
        HStack {
          ForEach(viewModel.stories) { story in
            UserStory(story: story)
              .padding(.trailing, 10)
          }
        }
      }
    }
  }
}

#Preview {
  let viewModel = StoriesViewModel()
  viewModel.stories = [
       .init(id: 1, image: "avatar1", user: "u1", story: "", createdAt: "", updatedAt: ""),
       .init(id: 2, image: "avatar2", user: "u2", story: "", createdAt: "", updatedAt: "")
     ]
  return StoryStrip(viewModel: viewModel)
}
