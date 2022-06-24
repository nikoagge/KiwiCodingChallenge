//
//  FlightTableViewCell.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 24/6/22.
//

import UIKit

public protocol FlightCellDelegate: AnyObject {
    var fromLabel: UILabel! { get }
    var toLabel: UILabel! { get }
    var priceLabel: UILabel! { get }
    var departureTimeLabel: UILabel! { get }
    var durationLabel: UILabel! { get }
    var bookButton: UIButton! { get }
}

class FlightTableViewCell: UITableViewCell,
                            FlightCellDelegate, ReusableViewDelegate {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var departureTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var bookButton: UIButton! {
        didSet {
            bookButton.layer.cornerRadius = 8
            bookButton.backgroundColor = .orange
        }
    }
}
