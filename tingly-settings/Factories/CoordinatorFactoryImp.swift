//
//  CoordinatorFactoryImp.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

final class CoordinatorFactoryImp: CoordinatorFactory {
  
  func makeSettingsCoordinator(router: Router) -> Coordinator & SettingsCoordinatorOutput {
    let coordinator = SettingsCoordinator(router: router)
    return coordinator
  }
  
}
