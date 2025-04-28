//
//  HomeScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/27/25.
//

import SwiftUI

struct HomeScreen: View {

  var body: some View {
    NavigationView {
      VStack {
        StoriesScreen()
        Spacer()
      }
      .navigationTitle("Bereal")
      .navigationBarItems(
        trailing:
          HStack {
            Image(systemName: "heart")
              .padding(.horizontal, 10)
            Image(systemName: "text.bubble")
              .padding(.horizontal, 10)
          }
      )
    }
  }
}

#Preview {
    HomeScreen()
}
