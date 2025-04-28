//
//  AddUserStories.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import SwiftUI

struct AddUserStories: View {

  var body: some View {
    HStack {
      UserStory()
        .overlay {
          VStack {

            Spacer()

            HStack {

              Spacer()

              Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .bottomTrailing)
            }
            .padding(10)
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
