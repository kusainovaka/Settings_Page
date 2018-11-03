//
//  SettingsLastSeenAssembly.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsLastSeenAssembly {
    static func makeLastSeen(coordinator: SettingsCoordinatorInput,
                             output: SettingsLastSeenPrivacyModuleOutput) -> Presentable? {
    let view = SettingsLastSeenViewController()
    let interactor = SettingsLastSeenInteractor()
    let presenter = SettingsLastSeenPresenter(interactor: interactor, moduleOutput: output)
    view.presenter = presenter
    presenter.coordinator = coordinator
    presenter.view = view
    interactor.presenter = presenter
    return view
  }
}
