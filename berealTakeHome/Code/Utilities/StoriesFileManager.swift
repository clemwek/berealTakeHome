//
//  StoriesFileManager.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

class StoriesFileManager {

  public static let shared = StoriesFileManager()

  private let filename = "mockStories.json"

  private init() {}

  private var fileURL: URL {
    let docs = FileManager.default.urls(
      for: .documentDirectory, in: .userDomainMask
    ).first!
    return docs.appendingPathComponent(filename)
  }

  func prepareFileIfNeeded() throws {
    let fileManager = FileManager.default
    guard !fileManager.fileExists(atPath: fileURL.path) else { return }

    if let bundleURL = Bundle.main.url(
      forResource: "mockStories", withExtension: "json"
    ) {
      try fileManager.copyItem(at: bundleURL, to: fileURL)
    } else {
      throw NSError(
        domain: "StoriesFileManager",
        code: 1,
        userInfo: [NSLocalizedDescriptionKey: "mockStories.json not in bundle"]
      )
    }
  }

  func load() throws -> Data? {
    try prepareFileIfNeeded()
    return try Data(contentsOf: fileURL)
  }

  func load() throws -> StoriesResponse {
    try prepareFileIfNeeded()
    let data = try Data(contentsOf: fileURL)
    return try JSONDecoder().decode(StoriesResponse.self, from: data)
  }

  func save(_ response: StoriesResponse) throws {
    let data = try JSONEncoder().encode(response)
    try data.write(to: fileURL, options: .atomic)
  }
}
