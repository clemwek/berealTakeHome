//
//  APIRequest.swift
//  berealTakeHome
//
//  Created by Clement  Wekesa on 4/28/25.
//

import Foundation

typealias CompletionHandler = (Data) -> Void
typealias FailureHandler = (APIError) -> Void

struct EmptyRequest: Encodable {}
struct EmptyResponse: Decodable {}

enum HTTPMethod: String {
  case get
  case put
  case delete
  case post
}

class APIRequest<Parameters: Encodable, Model: Decodable> {

  static func call(
    scheme: String = Config.shared.scheme,
    host: String = Config.shared.host,
    path: String,
    method: HTTPMethod,
    authorized: Bool,
    queryItems: [URLQueryItem]? = nil,
    parameters: Parameters? = nil,
    mockData: Data? = nil,
    completion: @escaping CompletionHandler,
    failure: @escaping FailureHandler
  ) {
    if handleMock(for: path, mockData: mockData, completion: completion) { return }

    guard NetworkMonitor.shared.isReachable else {
      return failure(.noInternet)
    }

    guard let url = buildURL(
      scheme: scheme,
      host: host,
      path: path,
      method: method,
      queryItems: queryItems,
      parameters: parameters
    ) else {
      return
    }

    let request = buildRequest(
      url: url,
      method: method,
      parameters: parameters,
      authorized: authorized
    )

    execute(request: request, completion: completion, failure: failure)
  }

  // MARK: - Helpers

  private static func handleMock(
    for path: String,
    mockData: Data?,
    completion: @escaping CompletionHandler
  ) -> Bool {
    guard let mock = mockData else { return false }
    if path.contains("like") {
      print("Mocking a like call")
    }
    DispatchQueue.main.async { completion(mock) }
    return true
  }

  private static func buildURL(
    scheme: String,
    host: String,
    path: String,
    method: HTTPMethod,
    queryItems: [URLQueryItem]?,
    parameters: Parameters?
  ) -> URL? {
    var components = URLComponents()
    components.scheme = scheme
    components.host   = host
    components.path   = path

    // merge query + GET-params
    var allItems = queryItems ?? []
    if method == .get, let params = parameters {
      allItems += encodeParametersAsQueryItems(params)
    }
    components.queryItems = allItems.isEmpty ? nil : allItems
    return components.url
  }

  private static func encodeParametersAsQueryItems(_ params: Parameters) -> [URLQueryItem] {
    guard
      let data = try? JSONEncoder().encode(params),
      let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else {
      return []
    }

    return dict.compactMap { key, value in
      switch value {
      case let stringValue as String:
        return URLQueryItem(name: key, value: stringValue)
      case let numberValue as NSNumber:
        return URLQueryItem(name: key, value: numberValue.stringValue)
      default:
        return nil
      }
    }
  }

  private static func buildRequest(
    url: URL,
    method: HTTPMethod,
    parameters: Parameters?,
    authorized: Bool
  ) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")

    if method != .get, let params = parameters {
      request.httpBody = try? JSONEncoder().encode(params)
    }

    if authorized, let token = Auth.shared.getAccessToken() {
      request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
    return request
  }

  private static func execute(
    request: URLRequest,
    completion: @escaping CompletionHandler,
    failure: @escaping FailureHandler
  ) {
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
      if let data = data {
        print("JSON String:", String(data: data, encoding: .utf8) ?? "–")
        completion(data)
      } else if error != nil {
        failure(.response)
      }
    }
    task.resume()
  }
}
