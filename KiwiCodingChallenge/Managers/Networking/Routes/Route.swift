//
//  Router.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

public typealias Parameters = [String: String]

protocol RouteDelegate {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"
    case trace = "TRACE"
    case connect = "CONNECT"
}

extension RouteDelegate {
    public func asURLComponents() throws -> URLComponents? {
        guard let url = URL(string: baseURL) else { throw NetworkingError.badRequest }
        var urlComponents = URLComponents(url: url.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        
        if let parameters = parameters {
            do {
                if method == .get {
                    urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
                }
            }
        }
        
        return urlComponents
    }
}
