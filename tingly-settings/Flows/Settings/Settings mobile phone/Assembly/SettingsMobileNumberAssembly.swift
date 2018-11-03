//
//  SettingsMobileNumberAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsMobileNumberAssembly {
    
  static func makeSettingsMobileNumber(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsMobileNumberViewController(nibName: nil, bundle: nil)
    let interactor = SettingsMobileNumberInteractor()
    let presenter = SettingsMobileNumberPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
