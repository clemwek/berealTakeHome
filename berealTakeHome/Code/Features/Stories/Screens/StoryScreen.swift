//
//  StoryScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct StoryScreen: View {

  var body: some View {
    Color
      .green
      .overlay {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      }
      .frame(height: 100)
    Spacer()
  }
}

#Preview {
  StoryScreen()
}
