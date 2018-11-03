//
//  SettingsNotificationsAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsNotificationsAssembly {
  static func makeSettingsNotifications(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsNotificationsViewController(nibName: nil, bundle: nil)
    let interactor = SettingsNotificationsInteractor()
    let presenter = SettingsNotificationsPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
