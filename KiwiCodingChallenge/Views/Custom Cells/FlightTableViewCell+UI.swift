//
//  FlightTableViewCell+UI.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import UIKit

extension FlightTableViewCell {
    func setupUI() {
        setupContainerStackView()
        setupFlightInformationStackView()
        setupCostAndBookButtonStackView()
    }
}

private extension FlightTableViewCell {
    func setupContainerStackView() {
        contentView.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13)
        ])
        containerStackViewConfiguration()
    }
    
    func setupFlightInformationStackView() {
        flightInformationStackView.addArrangedSubview(departureInfoLabel)
        flightInformationStackView.addArrangedSubview(departureTimeInfoLabel)
        flightInformationStackView.addArrangedSubview(travelTimeInfoLabel)
        flightInformationStackView.addArrangedSubview(arrivalInfoLabel)
        containerStackView.addArrangedSubview(flightInformationStackView)
        flightInformationStackViewConfiguration()
    }
    
    func setupCostAndBookButtonStackView() {
        costAndBookButtonStackView.addArrangedSubview(costLabel)
        NSLayoutConstraint.activate([
            bookButton.widthAnchor.constraint(equalToConstant: 103),
            bookButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        costAndBookButtonStackView.addArrangedSubview(bookButton)
        containerStackView.addArrangedSubview(costAndBookButtonStackView)
        costAndBookButtonStackViewConfiguration()
    }
}
