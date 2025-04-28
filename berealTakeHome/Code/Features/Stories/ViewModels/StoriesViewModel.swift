//
//  StoriesViewModel.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

class StoriesViewModel: ObservableObject {

  @Published var stories: [StoryModel] = []
  @Published var error: APIError?

  let pageItem = URLQueryItem(name: "page", value: "1")

  func fetchStories() {
    StoriesAction(
      queryItems: [ pageItem ]
    ).call {response in
      self.error = nil
      self.stories = response.stories
      print("We are getting here! ", response)
    } failure: { error in
      print("ViewModel Error:", error)
      self.error = error
    }
  }
}
