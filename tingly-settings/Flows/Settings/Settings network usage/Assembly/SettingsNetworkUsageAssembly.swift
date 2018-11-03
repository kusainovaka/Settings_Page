//
//  SettingsNetworkUsageAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsNetworkUsageAssembly {
  static func makeSettingsNetworkUsage(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsNetworkUsageViewController(nibName: nil, bundle: nil)
    let interactor = SettingsNetworkUsageInteractor()
    let presenter = SettingsNetworkUsagePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
