//
//  SettingsChangeAvatarAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeAvatarAssembly {
    
  static func makeSettingsChangeAvatar(coordinator: SettingsCoordinatorInput,
                                       output: SettingsChangeMyAvatarModuleOutput) -> Presentable? {
    let view = SettingsChangeAvatarViewController()
    let interactor = SettingsChangeAvatarInteractor()
    let presenter = SettingsChangeAvatarPresenter(interactor: interactor, moduleOutput: output)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
