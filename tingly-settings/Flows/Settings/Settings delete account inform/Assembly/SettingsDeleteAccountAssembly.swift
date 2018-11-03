//
//  SettingsDeleteAccountAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsDeleteAccountAssembly {
  static func makeDeleteAccount(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsDeleteAccountViewController(nibName: nil, bundle: nil)
    let interactor = SettingsDeleteAccountInteractor()
    let presenter = SettingsDeleteAccountPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
