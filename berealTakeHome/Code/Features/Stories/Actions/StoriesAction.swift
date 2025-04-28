//
//  StoriesAction.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

struct StoriesAction {
  var path = "/stories"
  var method: HTTPMethod = .get
  var queryItems: [URLQueryItem]?

  func loadMockJson(filename: String = "mockStories.json") -> Data? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
      print("\(filename) not found in bundle")
      return nil
    }
    do {
      return try Data(contentsOf: url)
    } catch {
      print("Failed reading \(filename):", error)
      return nil
    }
  }

  func call(
    completion: @escaping (StoriesResponse) -> Void,
    failure: @escaping (APIError) -> Void
  ) {
    APIRequest<StoriesRequest, StoriesResponse>.call(
      path: path,
      method: method,
      authorized: true,
      queryItems: queryItems,
      mockData: loadMockJson()
    ) { data in

      if let response = try? JSONDecoder().decode(
        StoriesResponse.self,
        from: data
      ) {
        completion(response)
      } else {
        failure(.jsonDecoding)
      }
    } failure: { error in
      failure(error)
    }
  }
}
