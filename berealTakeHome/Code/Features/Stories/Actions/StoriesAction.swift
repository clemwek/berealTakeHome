//
//  StoriesAction.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

struct StoriesAction {
  let path = "/stories"
  let method: HTTPMethod = .get
  var queryItems: [URLQueryItem]?

  func loadJson(filename fileName: String) -> StoriesResponse? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(StoriesResponse.self, from: data)
        return jsonData
      } catch {
        print("error:\(error)")
      }
    }
    return nil
  }

  func loadMockJson() -> Data? {
    let jsonString =
    """
    {
        "stories": [
          {
            "id": 1,
            "image": "avatar1",
            "story": {"id": 1, "story": "r1", "seen": true, "liked": false},
            "user": "user1",
            "createdAt": "2025-04-01T10:00:00Z",
            "updatedAt": "2025-04-01T12:00:00Z"
          },
          {
            "id": 2,
            "image": "avatar2",
            "story": {"id": 1, "story": "r2", "seen": false, "liked": true},
            "user": "user2",
            "createdAt": "2025-04-02T11:30:00Z",
            "updatedAt": "2025-04-02T14:00:00Z"
          },
          {
            "id": 3,
            "image": "avatar3",
            "story": {"id": 1, "story": "r3", "seen": false, "liked": true},
            "user": "user3",
            "createdAt": "2025-04-03T09:00:00Z",
            "updatedAt": "2025-04-03T10:00:00Z"
          },
          {
            "id": 4,
            "image": "avatar4",
            "story": {"id": 1, "story": "r4", "seen": true, "liked": false},
            "user": "user4",
            "createdAt": "2025-04-04T08:45:00Z",
            "updatedAt": "2025-04-04T09:15:00Z"
          }
        ]
    }
    """
    let mockData = jsonString.data(using: .utf8)
    return mockData
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
