//
//  SettingsEditProfileAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsEditProfileAssembly {

  static func makeEditProfile(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsEditProfileViewController(nibName: nil, bundle: nil)
    let interactor = SettingsEditProfileInteractor()
    let presenter = SettingsEditProfilePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
