//
//  RootScreen.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/27/25.
//

import SwiftUI

struct RootScreen: View {

  var body: some View {

    TabView {
      HomeScreen()
        .tabItem {
          Label("Home", systemImage: "house")
        }
    }
  }
}

#Preview {
  RootScreen()
}
