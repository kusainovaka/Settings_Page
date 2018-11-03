//
//  SettingsStorageUsageAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsStorageUsageAssembly {
  static func makeSettingsStorageUsage(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsStorageUsageViewController(nibName: nil, bundle: nil)
    let interactor = SettingsStorageUsageInteractor()
    let presenter = SettingsStorageUsagePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
