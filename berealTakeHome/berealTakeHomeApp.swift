//
//  berealTakeHomeApp.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/27/25.
//

import SwiftUI

@main
struct BerealTakeHomeApp: App {

  init() {
    NetworkMonitor.shared.startMonitoring()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
