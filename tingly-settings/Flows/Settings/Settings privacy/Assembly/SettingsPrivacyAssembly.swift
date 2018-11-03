//
//  SettingsPrivacyAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyAssembly {
  static func makeSettingsPrivacy(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsPrivacyViewController()
    let interactor = SettingsPrivacyInteractor()
    let presenter = SettingsPrivacyPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
