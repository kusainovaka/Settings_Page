//
//  SettingsAvatarAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAvatarAssembly {
    
  static func makeSettingsAvatar(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsAvatarViewController(nibName: nil, bundle: nil)
    let interactor = SettingsAvatarInteractor()
    let presenter = SettingsAvatarPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
