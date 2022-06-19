//
//  FlightResponse.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

struct FlightResponse: Codable {
    let data: [FlightData]
    
    struct FlightData: Codable {
        let cityFrom: String
        let cityTo: String
        let price: Int
        let departureTimeInUTC: Date
        let arrivalTimeInUTC: Date
        let distance: Double
        let flyDuration: String
        let deepLink: URL
        
        private enum CodingKeys: String, CodingKey {
            case cityFrom, cityTo, price, distance
            case departureTimeInUTC = "dTimeUTC"
            case arrivalTimeInUTC = "aTimeUTC"
            case flyDuration = "fly_duration"
            case deepLink = "deep_link"
        }
    }
}
