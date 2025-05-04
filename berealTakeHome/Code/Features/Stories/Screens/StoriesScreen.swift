//
//  StoryScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoriesScreen: View {

  @StateObject var viewModel: StoriesViewModel

  var body: some View {
    StoryStrip(viewModel: viewModel)
      .frame(height: 150)
      .task {
        viewModel.fetchStories()
      }

    Spacer()
  }
}

#Preview {
  StoriesScreen(viewModel: StoriesViewModel())
}
