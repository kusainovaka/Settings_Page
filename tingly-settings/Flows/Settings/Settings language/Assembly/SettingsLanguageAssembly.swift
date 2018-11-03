//
//  SettingsLanguageAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsLanguageAssembly {
    
  static func makeSettingsLanguage(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsLanguageViewController(nibName: nil, bundle: nil)
    let interactor = SettingsLanguageInteractor()
    let presenter = SettingsLanguagePresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
