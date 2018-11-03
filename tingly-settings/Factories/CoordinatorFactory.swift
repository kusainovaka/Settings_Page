//
//  CoordinatorFactory.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation
protocol CoordinatorFactory {
  
  func makeSettingsCoordinator(router: Router) -> SettingsCoordinatorOutput & Coordinator
  
}
