//
//  SettingsAboutTextAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAboutTextAssembly {
  static func makeSettingsAboutText(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsAboutTextViewController(nibName: nil, bundle: nil)
    let interactor = SettingsAboutTextInteractor()
    let presenter = SettingsAboutTextPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
