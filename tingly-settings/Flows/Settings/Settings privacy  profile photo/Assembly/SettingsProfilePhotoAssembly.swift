//
//  SettingsProfilePhotoAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsProfilePhotoAssembly {
  static func makeProfilePhoto(coordinator: SettingsCoordinatorInput,
        output: SettingsProfilePhotoModuleOutput) -> Presentable? {
    let view = SettingsProfilePhotoViewController()
    let interactor = SettingsProfilePhotoInteractor()
    let presenter = SettingsProfilePhotoPresenter(interactor: interactor, moduleOutput: output)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
