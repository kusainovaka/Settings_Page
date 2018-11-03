//
//  SettingsChangeNumberAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeNumberAssembly {
  static func makeSettingsChangeNumber(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsChangeNumberViewController(nibName: nil, bundle: nil)
    let interactor = SettingsChangeNumberInteractor()
    let presenter = SettingsChangeNumberPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
