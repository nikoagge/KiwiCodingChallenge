//
//  URLSession+Extension.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, onCompletion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: { (data, urlResponse, error) in
            if let error = error {
                onCompletion(.failure(error))
            } else if let data = data, let urlResponse = urlResponse as? HTTPURLResponse {
                onCompletion(.success((data, urlResponse)))
            }
        })
    }
}
