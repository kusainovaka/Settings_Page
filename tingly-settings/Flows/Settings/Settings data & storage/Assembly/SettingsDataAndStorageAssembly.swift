//
//  SettingsDataAndStorageAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation
class SettingsDataAndStorageAssembly {
  static func makeSettingsDataAndStorage(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsDataAndStorageViewController(nibName: nil, bundle: nil)
    let interactor = SettingsDataAndStorageInteractor()
    let presenter = SettingsDataAndStoragePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
