//
//  HomeViewController.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 18/6/22.
//

import UIKit

public protocol HomeViewControllerDelegate: AnyObject {
    func didBookFlightButtonPressed(url: URL?)
}

final class HomeViewController: UIViewController {
    let flightService: FlightService
    var viewModel: FlightViewModel?
    var indicator: UIView?
    
    weak var homeViewControllerDelegate: HomeViewControllerDelegate?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(refresh(_:)),
                                 for: UIControl.Event.valueChanged)

        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Flight Offers")
        return refreshControl
    }()
    
    var homeTableView = UITableView.newViewSetForAutoLayout()
    
    init(flightService: FlightService) {
        self.flightService = flightService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.tableView.delegate = homeView
        homeView.tableView.dataSource = self
        homeView.tableView.addSubview(refreshControl)
        
        registerCellForReuse()
        requestFlightOffers()
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        self.requestFlightOffers()
    }
    

    @IBAction func didBookFlighButtonPressed(_ sender: UIButton) {
        let url = viewModel?.getURL(from: sender.tag)
        delegate?.didBookFlightButtonPressed(url: url)
    }
    
    private func registerCellForReuse() {
        homeView.tableView.register(FlightTableViewCell.nib, forCellReuseIdentifier: FlightTableViewCell.reuseIdentifier)
    }
    
    private func requestFlightOffers() {
        indicator = showActivityIndicatory(onView: self.view)
        
        flightService.fetchFlights { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.viewModel = FlightViewModel(flights: response)
                    self.homeView.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                
                guard let indicator = self.indicator else { return }
                self.removeIndicator(indicator: indicator)
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRowsInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeView.tableView.dequeueReusableCell(withIdentifier: FlightTableViewCell.reuseIdentifier, for: indexPath) as? FlightTableViewCell else {
            return self.tableView(tableView, cellForRowAt: indexPath)
        }
        
        viewModel?.configureFlightCell(cell, for: indexPath)
        cell.selectionStyle = .none
        
        return cell
    }
}
