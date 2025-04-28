//
//  StoryDetailScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoryDetailScreen: View {

  @ObservedObject var viewModel: StoriesViewModel
  var story: StoryModel?
  @State private var isLiked: Bool

  init(viewModel: StoriesViewModel, story: StoryModel?) {
    self.viewModel = viewModel
    self.story = story
    _isLiked = State(initialValue: story?.story.liked ?? false)
  }

  var body: some View {
    VStack {
      Image(story?.story.story ?? "r1")
        .edgesIgnoringSafeArea(.top)
        .onTapGesture(count: 2) {
          isLiked.toggle()
          var newStory = story
          newStory?.story.liked = self.isLiked
          viewModel.likeStory(newStory)
        }
      HStack {
        Image(systemName: isLiked ? "heart" : "heart.fill")
          .resizable()
          .frame(width: 40, height: 40)
          .padding(.bottom, 60)
          .onTapGesture {
            isLiked.toggle()
          }
      }
    }
  }
}

#Preview {
  StoryDetailScreen(viewModel: StoriesViewModel(),
                    story: StoryModel(id: 1,
                                      image: "avatar6",
                                      user: "user2",
                                      story: Story(id: 1,
                                                   story: "r9",
                                                   seen: true,
                                                   liked: true),
                                      createdAt: "2025-04-04T09:15:00Z",
                                      updatedAt: "2025-04-04T09:15:00Z"))
}
