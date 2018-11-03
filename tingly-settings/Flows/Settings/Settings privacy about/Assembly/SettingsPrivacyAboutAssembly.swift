//
//  SettingsPrivacyAboutAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyAboutAssembly {
    static func makePrivacyAbout(coordinator: SettingsCoordinatorInput,
                                 output: SettingsPrivacyAboutModuleOutput) -> Presentable? {
    let view = SettingsPrivacyAboutViewController()
    let interactor = SettingsPrivacyAboutInteractor()
    let presenter = SettingsPrivacyAboutPresenter(interactor: interactor, moduleOutput: output)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
