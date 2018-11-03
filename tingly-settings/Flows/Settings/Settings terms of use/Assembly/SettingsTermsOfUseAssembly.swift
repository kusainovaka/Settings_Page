//
//  SettingsTermsOfUseAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 24.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsTermsOfUseAssembly {
  static func makeSettingsTermsOfUse(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsTermsOfUseViewController(nibName: nil, bundle: nil)
    let interactor = SettingsTermsOfUseInteractor()
    let presenter = SettingsTermsOfUsePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
