//
//  UserStory.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct UserStory: View {

  var body: some View {
    Image(systemName: "person.circle")
      .resizable()
      .frame(width: 100, height: 100)
      .padding(25)
      .clipShape(.circle)
      .overlay(Circle().stroke(Color.white, lineWidth: 5))
      .shadow(radius: 10)
  }
}

#Preview {
  UserStory()
}
