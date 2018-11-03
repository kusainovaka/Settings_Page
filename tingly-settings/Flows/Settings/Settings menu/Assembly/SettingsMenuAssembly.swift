//
//  SettingsMenuAssembly.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsMenuAssembly {
  
  static func makeSettingsMenu(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsMenuViewController(nibName: nil, bundle: nil)
    let interactor = SettingsMenuInteractor()
    let presenter = SettingsMenuPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
