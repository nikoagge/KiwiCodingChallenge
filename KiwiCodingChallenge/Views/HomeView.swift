//
//  HomeView.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 24/6/22.
//

import UIKit

class HomeView: UIView {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
}

extension HomeView: UITableViewDelegate {
}
