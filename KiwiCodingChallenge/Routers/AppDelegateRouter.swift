//
//  AppDelegateRouter.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 24/6/22.
//

import UIKit

public class AppDelegateRouter: Router {
  public let window: UIWindow

  public init(window: UIWindow) {
    self.window = window
  }

  public func present(_ viewController: UIViewController, animated: Bool, onDismissed: (()->Void)?) {
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }

  public func dismiss(animated: Bool) {
  }
}
