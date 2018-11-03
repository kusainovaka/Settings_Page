//
//  SettingsEnterCodeAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 16.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsEnterCodeAssembly {
  static func makeSettingsEnterCode(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsEnterCodeViewController(nibName: nil, bundle: nil)
    let interactor = SettingsEnterCodeInteractor()
    let presenter = SettingsEnterCodePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
