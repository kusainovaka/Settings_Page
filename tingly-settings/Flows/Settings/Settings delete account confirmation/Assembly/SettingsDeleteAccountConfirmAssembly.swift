//
//  SettingsDeleteAccountConfirmAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsDeleteAccountConfirmAssembly {
  static func makeDeleteAccountConfirm(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsDeleteAccountConfirmViewController(nibName: nil, bundle: nil)
    let interactor = SettingsDeleteAccountConfirmInteractor()
    let presenter = SettingsDeleteAccountConfirmPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
