//
//  SettingsCustomisePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsCustomisePresenter {
  weak var view: SettingsCustomiseViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private let interactor: SettingsCustomiseInteractorInput

  init(interactor: SettingsCustomiseInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsCustomisePresenter: SettingsCustomiseViewOutput {
  func viewDidLoad() {

  }
}

extension SettingsCustomisePresenter: SettingsCustomiseInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
