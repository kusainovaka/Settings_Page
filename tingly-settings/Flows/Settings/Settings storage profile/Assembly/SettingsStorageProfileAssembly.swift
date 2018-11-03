//
//  SettingsStorageProfileAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsStorageProfileAssembly {
  static func makeSettingsStorageProfile(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsStorageProfileViewController(nibName: nil, bundle: nil)
    let interactor = SettingsStorageProfileInteractor()
    let presenter = SettingsStorageProfilePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
