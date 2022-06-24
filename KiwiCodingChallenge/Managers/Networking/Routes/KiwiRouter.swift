//
//  KiwiRouter.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

enum KiwiRoute {
    case popularFlights(dateFrom: String, dateTo: String)
}

extension KiwiRoute: RouteDelegate {
    var baseURL: String {
        return "https://api.skypicker.com"
    }
    
    var method: HTTPMethod {
        switch self {
        case .popularFlights:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .popularFlights:
            return "/flights"
        }
    }
    
    //TODO: - Check if parameters need some configuration later
    var parameters: Parameters? {
        switch self {
        case .popularFlights(let dateFrom, let dateTo):
            return [
                "v": "3",
                "sort:": "popularity",
                "locale:": "en",
                "adults": "1",
                "children": "0",
                "infants": "0",
                "flyFrom": "49.2-16.61-250km",
                "to": "anywhere",
                "dateFrom": dateFrom,
                "dateTo": dateTo,
                "typeFlight": "oneway",
                "vehicle_type": "aircraft",
                "limit": "5",
                "one_per_date": "1",
                "one_for_city": "1",
                "partner": "skypicker"
            ]
        }
    }
}
