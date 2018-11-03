//
//  SettingsAskQuestionAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAskQuestionAssembly {
  static func makeSettingsAskQuestion(coordinator: SettingsCoordinatorInput) -> Presentable? {
    let view = SettingsAskQuestionViewController(nibName: nil, bundle: nil)
    let interactor = SettingsAskQuestionInteractor()
    let presenter = SettingsAskQuestionPresenter(interactor: interactor)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
