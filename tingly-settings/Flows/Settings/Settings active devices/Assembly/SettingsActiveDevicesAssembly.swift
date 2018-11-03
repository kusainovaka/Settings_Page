//
//  SettingsActiveDevicesAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 14.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsActiveDevicesAssembly {
  static func makeSettingsActiveDevices(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsActiveDevicesViewController(nibName: nil, bundle: nil)
    let interactor = SettingsActiveDevicesInteractor()
    let presenter = SettingsActiveDevicesPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
