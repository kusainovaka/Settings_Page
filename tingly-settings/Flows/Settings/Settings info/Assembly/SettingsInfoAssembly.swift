//
//  SettingsInfoAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsInfoAssembly {

  static func makeSettingsInfo(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsInfoViewController(nibName: nil, bundle: nil)
    let interactor = SettingsInfoInteractor()
    let presenter = SettingsInfoPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
