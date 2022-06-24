//
//  AppDependency.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 24/6/22.
//

import Foundation

public protocol Container: AnyObject {
    var networkingManager: NetworkingManagerDelegate { get }
    var flightService: FlightServiceDelegate { get }
}

final class AppDependency: Container {
    lazy var networkingManager: NetworkingManagerDelegate = NetworkingManager()
    lazy var flightService: FlightServiceDelegate = FlightService(networkingManagerDelegate: networkingManager)
}
