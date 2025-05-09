//
//  Auth.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation
import SwiftKeychainWrapper

class Auth: ObservableObject {

  static let shared = Auth()

  private let keychain: KeychainWrapper = .standard

  @Published var loggedIn: Bool = false

  private init() {
    loggedIn = hasAccessToken()
  }

  func getCredentials() -> Credentials {
    return Credentials(
      accessToken: keychain.string(forKey: KeychainKey.accessToken.rawValue),
      refreshToken: keychain.string(forKey: KeychainKey.refreshToken.rawValue)
    )
  }

  func setCredentials(accessToken: String, refreshToken: String) {
    keychain.set(accessToken, forKey: KeychainKey.accessToken.rawValue)
    keychain.set(refreshToken, forKey: KeychainKey.refreshToken.rawValue)

    loggedIn = true
  }

  func hasAccessToken() -> Bool {
    return getCredentials().accessToken != nil
  }

  func getAccessToken() -> String? {
    return getCredentials().accessToken
  }

  func getRefreshToken() -> String? {
    return getCredentials().refreshToken
  }

  func logout() {
    KeychainWrapper.standard.removeObject(forKey: KeychainKey.accessToken.rawValue)
    KeychainWrapper.standard.removeObject(forKey: KeychainKey.refreshToken.rawValue)

    loggedIn = false
  }
}
