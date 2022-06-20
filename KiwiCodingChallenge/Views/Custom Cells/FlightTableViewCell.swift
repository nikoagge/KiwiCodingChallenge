//
//  FlightTableViewCell.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import UIKit

protocol FlightCellDelegate: AnyObject {
    var fromLabel: UILabel! { get }
    var toLabel: UILabel! { get }
    var priceLabel: UILabel! { get }
    var departureTimeLabel: UILabel! { get }
    var durationLabel: UILabel! { get }
    var bookButton: UIButton! { get }
}

class FlightTableViewCell: UITableViewCell, ReusableViewDelegate {
    var containerStackView = UIStackView.newViewSetForAutoLayout()
    var flightInformationStackView = UIStackView.newViewSetForAutoLayout()
    var flightDateLabel = UILabel.newViewSetForAutoLayout()
    var departureInfoLabel = UILabel.newViewSetForAutoLayout()
    var departureTimeInfoLabel = UILabel.newViewSetForAutoLayout()
    var travelTimeInfoLabel = UILabel.newViewSetForAutoLayout()
    var arrivalInfoLabel = UILabel.newViewSetForAutoLayout()
    var costAndBookButtonStackView = UIStackView.newViewSetForAutoLayout()
    var costLabel = UILabel.newViewSetForAutoLayout()
    var bookButton = UIButton.newViewSetForAutoLayout()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
