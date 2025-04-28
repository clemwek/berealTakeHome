//
//  StoryStrip.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoryStrip: View {

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        AddUserStories()
        HStack {
          ForEach(0..<5) { _ in
            UserStory()
              .padding(.trailing, 10)
          }
        }
      }
    }
  }
}

#Preview {
  StoryStrip()
}
