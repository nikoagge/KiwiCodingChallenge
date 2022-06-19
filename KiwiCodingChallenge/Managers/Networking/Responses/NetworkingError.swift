//
//  NetworkingError.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

private enum NetworkingErrorMessages: String {
    case noAccessToService = "You don't have access to the service."
    case badRequest = "Bad request"
    case noConnectivity = "You seem to be offline. Check your connection"
    case unavailableService = "We are sorry, service is unavailable."
    case simpleErrorMessage = "Error Message"
}

enum NetworkingError: Error {
    case badRequest
    case notAuthenticated
    case forbidden
    case notFound
    case serverDown
    case unsuccessError(String)
    case networkProblem
    case unknown(HTTPURLResponse?)
    case userCancelled
    
    init(error: Error) {
        self = .networkProblem
    }
    
    init(urlResponse: URLResponse?) {
        guard let urlResponse = urlResponse as? HTTPURLResponse else {
            self = .unknown(nil)
            
            return
        }
        
        switch urlResponse.statusCode {
        case NetworkingError.badRequest.statusCode: self = .badRequest
        case NetworkingError.notAuthenticated.statusCode: self = .notAuthenticated
        case NetworkingError.forbidden.statusCode: self = .forbidden
        case NetworkingError.notFound.statusCode: self = .notFound
        case NetworkingError.serverDown.statusCode: self = .serverDown
        default: self = .unknown(urlResponse)
        }
    }
    
    var isAuthenticationError: Bool {
        switch self {
        case .notAuthenticated: return true
        default: return false
        }
    }
    
    var statusCode: Int {
        switch self {
        case .badRequest: return 400
        case .notAuthenticated: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .serverDown: return 500
        case .networkProblem: return 10001
        case .unknown: return 10002
        case .userCancelled: return 99999
        case .unsuccessError: return 88888
        }
    }
    
    var errorMessages: String {
        switch self {
        case .forbidden: return NSLocalizedString(NetworkingErrorMessages.noAccessToService.rawValue, comment: NetworkingErrorMessages.simpleErrorMessage.rawValue)
        case .badRequest:  return NSLocalizedString(NetworkingErrorMessages.badRequest.rawValue, comment: NetworkingErrorMessages.simpleErrorMessage.rawValue)
        case .unsuccessError(let message): return message
        case .networkProblem: return NSLocalizedString(NetworkingErrorMessages.noConnectivity.rawValue, comment: NetworkingErrorMessages.simpleErrorMessage.rawValue)
        default: return NSLocalizedString(NetworkingErrorMessages.unavailableService.rawValue, comment: NetworkingErrorMessages.simpleErrorMessage.rawValue)
        }
    }
}

extension NetworkingError: Equatable {
    static func == (lhs: NetworkingError, rhs: NetworkingError) -> Bool {
        return lhs.statusCode == rhs.statusCode
    }
}
