//
//  FlightServiceAPI.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

protocol FlightServiceDelegate: AnyObject {
    func fetchFlights(result: @escaping (Result<[Flight], NetworkingError>) -> Void)
}

final class FlightService: FlightServiceDelegate {
    private var networkingManagerDelegate: NetworkingManagerDelegate
    
    init(networkingManagerDelegate: NetworkingManagerDelegate) {
        self.networkingManagerDelegate = networkingManagerDelegate
    }
    
    func fetchFlights(result: @escaping (Result<[Flight], NetworkingError>) -> Void) {
        let dateFrom = Date()
        let dateTo = Calendar.current.date(byAdding: .day, value: 7, to: dateFrom)!
        
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        
        guard let url = try? KiwiRoute.popularFlights(dateFrom: format.string(from: dateFrom), dateTo: format.string(from: dateTo)).asURLComponents()?.url else {
            return result(.failure(NetworkingError.badRequest))
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        networkingManagerDelegate.fetchDecodable(url: url, decoder: decoder) { (response: Result<FlightResponse, NetworkingError>) in
            switch response {
            case .success(let values):
                let flightResult = values.data.map { (flightData) -> Flight in
                    return Flight(flightResponse: flightData)
                }
                
                result(.success(flightResult))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
