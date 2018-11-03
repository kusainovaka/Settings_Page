//
//  SettingsProfileAboutAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsProfileAboutAssembly {
    
  static func makeSettingsProfileAbout(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsProfileAboutViewController(nibName: nil, bundle: nil)
    let interactor = SettingsProfileAboutInteractor()
    let presenter = SettingsProfileAboutPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
