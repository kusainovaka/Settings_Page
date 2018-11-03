//
//  ApplicationCoordinator.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

fileprivate var isAutorized: Bool = true

fileprivate enum LaunchInstructor {
  case main
  
  static func configure(isAutorized: Bool = isAutorized) -> LaunchInstructor {
   return .main
  }
}


final class ApplicationCoordinator: BaseCoordinator {
  
  private let coordinatorFactory: CoordinatorFactory
  private let router: Router
  
  private var instructor: LaunchInstructor {
    return LaunchInstructor.configure()
  }
  
  
  init(router: Router, coordinatorFactory: CoordinatorFactory) {
    self.router = router
    self.coordinatorFactory = coordinatorFactory
  }
  
  
  override func start(with option: DeepLinkOption?) {
    //start with deepLink
    if let option = option {
      switch option {
      default: childCoordinators.forEach { coordinator in
        coordinator.start(with: option)
        }
      }
      // default start
    } else {
      switch instructor {
      case .main: runMainFlow(deepLink: nil)
      }
    }
  }
  
  private func runMainFlow(deepLink: DeepLinkOption?) {
    let coordinator = coordinatorFactory.makeSettingsCoordinator(router: router)
    coordinator.finishFlow = { [weak coordinator, weak self] in
      self?.removeDependency(coordinator)
    }
    addDependency(coordinator)
    coordinator.start()
  }
  
}
