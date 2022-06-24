//
//  HomeCoordinator.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 24/6/22.
//

import UIKit

public class HomeCoordinator: Coordinator {
  public var children: [Coordinator] = []
  public let router: Router
  public var container: Container

  public init(router: Router, container: Container) {
    self.router = router
    self.container = container
  }

  public func present(animated: Bool, onDismissed: (() -> Void)?) {
      let viewController = HomeViewController(flightService: container.flightService as! FlightService)
    viewController.delegate = self
    router.present(viewController, animated: animated, onDismissed: onDismissed)
  }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    public func didBookFlightButtonPressed(url: URL?) {
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
}
