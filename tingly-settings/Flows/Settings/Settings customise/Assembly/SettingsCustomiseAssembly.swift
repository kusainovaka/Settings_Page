//
//  SettingsCustomiseAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsCustomiseAssembly {
  static func makeCustomise(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsCustomiseViewController(nibName: nil, bundle: nil)
    let interactor = SettingsCustomiseInteractor()
    let presenter = SettingsCustomisePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
