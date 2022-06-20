//
//  FlightTableViewCell+Configuration.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import Foundation

extension FlightTableViewCell {
    func containerStackViewConfiguration() {
        containerStackView.axis = .horizontal
        containerStackView.alignment = .fill
        containerStackView.distribution = .fill
    }
    
    func departureInfoLabelConfiguration() {
        departureInfoLabel.text = "WED 24. 05"
        departureInfoLabel.font = .makeSystem(17, .bold)
    }
    
    func departureTimeInfoLabelConfiguration() {
        departureTimeInfoLabel.text = "18:30 Athens"
        departureInfoLabel.font = .makeSystem(16, .regular)
    }
    
    func travelTimeInfoLabelConfiguration() {
        travelTimeInfoLabel.text = "Travel time: 3h 20m"
        departureInfoLabel.font = .makeSystem(13, .light)
    }
    
    func arrivalInfoLabelConfiguration() {
        arrivalInfoLabel.text = "21:50 Berlin"
        arrivalInfoLabel.font = .makeSystem(14, .semibold)
    }
    
    func flightInformationStackViewConfiguration() {
        departureInfoLabelConfiguration()
        departureTimeInfoLabelConfiguration()
        travelTimeInfoLabelConfiguration()
        arrivalInfoLabelConfiguration()
        flightInformationStackView.axis = .vertical
        flightInformationStackView.alignment = .leading
        flightInformationStackView.distribution = .fillProportionally
        flightInformationStackView.spacing = 4
    }
    
    func costAndBookButtonStackViewConfiguration() {
        costLabelConfiguration()
        bookButtonConfiguration()
        costAndBookButtonStackView.axis = .vertical
        costAndBookButtonStackView.alignment = .fill
        costAndBookButtonStackView.distribution = .fillProportionally
        costAndBookButtonStackView.spacing = 8
    }
    
    func costLabelConfiguration() {
        costLabel.text = "94 €"
        costLabel.font = .makeSystem(22, .bold)
    }
    
    func bookButtonConfiguration() {
        bookButton.setTitle("Book", for: .normal)
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.titleLabel?.font = .makeSystem(17, .regular)
        bookButton.setTitleColor(.bookButtonBackgroundColor, for: .normal)
        bookButton.fround(with: 8)
    }
}
