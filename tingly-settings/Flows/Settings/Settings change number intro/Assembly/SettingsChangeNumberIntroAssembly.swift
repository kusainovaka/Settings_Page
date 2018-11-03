//
//  SettingsChangeNumberIntroAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeNumberIntroAssembly {
  static func makeSettingsChangeNumberIntro(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsChangeNumberIntroViewController(nibName: nil, bundle: nil)
    let interactor = SettingsChangeNumberIntroInteractor()
    let presenter = SettingsChangeNumberIntroPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
