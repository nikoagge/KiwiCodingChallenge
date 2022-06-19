//
//  NetworkingManager.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

protocol NetworkingManagerDelegate: AnyObject {
    func fetchDecodable<T: Decodable>(url: URL, decoder: JSONDecoder, onCompletion: @escaping (Result<T, NetworkingError>) -> Void)
}

final class NetworkingManager: NetworkingManagerDelegate {
    private let urlSession = URLSession.shared
    
    func fetchDecodable<T: Decodable>(url: URL, decoder: JSONDecoder = JSONDecoder(), onCompletion: @escaping (Result<T, NetworkingError>) -> Void) {
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (data, response)):
                guard response.statusCode >= 200, response.statusCode < 300 else {
                    onCompletion(.failure(NetworkingError(urlResponse: response)))
                    
                    return
                }
                
                do {
                    let values = try decoder.decode(T.self, from: data)
                    onCompletion(.success(values))
                } catch let error {
                    debugPrint(error)
                    onCompletion(.failure(NetworkingError.unsuccessError(error.localizedDescription)))
                }
            case .failure(let error):
                onCompletion(.failure(NetworkingError(error: error)))
            }
        }.resume()
    }
}
