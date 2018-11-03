//
//  SettingsPrivacyBlockedAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 30.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyBlockedAssembly {
  static func makePrivacyBlockedAssembly(coordinator: SettingsCoordinatorInput,  output: SettingsPrivacyBlockedModuleOutput) -> Presentable? {
    let view = SettingsPrivacyBlockedViewController()
    let interactor = SettingsPrivacyBlockedInteractor()
    let presenter = SettingsPrivacyBlockedPresenter(interactor: interactor, moduleOutput: output)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
