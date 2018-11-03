//
//  SettingsSoundAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsSoundAssembly {
  static func makeSettingsSound(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsSoundViewController(nibName: nil, bundle: nil)
    let interactor = SettingsSoundInteractor()
    let presenter = SettingsSoundPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
