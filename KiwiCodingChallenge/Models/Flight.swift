//
//  Flight.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

public struct Flight {
    let from: String
    let to: String
    let price: Int
    let departureTime: Date
    let arrivalTime: Date
    let duration: String
    let linkToBook: URL
}

extension Flight {
    init(flightResponse: FlightResponse.FlightData) {
        from = flightResponse.cityFrom
        to = flightResponse.cityTo
        price = flightResponse.price
        departureTime = flightResponse.departureTimeInUTC
        arrivalTime = flightResponse.arrivalTimeInUTC
        duration = flightResponse.flyDuration
        linkToBook = flightResponse.deepLink
    }
}
