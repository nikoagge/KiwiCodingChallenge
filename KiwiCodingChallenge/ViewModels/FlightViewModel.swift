//
//  FlightViewModel.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

class FlightViewModel {
    private let flights: [Flight]
    
    init(flights: [Flight]) {
        self.flights = flights
    }
    
    var numberOfRowsInSection: Int {
        return flights.count
    }
    
    private func getFlight(from index: Int) -> Flight {
        return flights[index]
    }
    
    func getURL(from index: Int) -> URL {
        return getFlight(from: index).linkToBook
    }
    
    func configureFlightCell(_ view: FlightCellDelegate, for indexPath: IndexPath) {
        let flight = getFlight(from: indexPath.row)
        
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        let headerFormat = DateFormatter()
        headerFormat.dateFormat = "E, d MMM yyyy"
        
        view.departureTimeLabel.text = headerFormat.string(from: flight.departureTime)
        view.fromLabel.text = "\(format.string(from: flight.departureTime)) \(flight.from)"
        view.toLabel.text = "\(format.string(from: flight.arrivalTime)) \(flight.to)"
        view.durationLabel.text = "Travel time: \(flight.duration)"
        view.priceLabel.text = "\(flight.price) €"
        view.bookButton.tag = indexPath.row
    }
}
