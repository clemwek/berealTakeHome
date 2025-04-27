//
//  ContentView.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/27/25.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("ContentView.WelcomeMessage".localized(arguments: "Clem"))
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
