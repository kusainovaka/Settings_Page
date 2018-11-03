//
//  SettingsDeleteAccountPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsDeleteAccountPresenter {
    
  weak var view: SettingsDeleteAccountViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsDeleteAccountInteractorInput

  init(interactor: SettingsDeleteAccountInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsDeleteAccountPresenter: SettingsDeleteAccountViewOutput {
  func viewDidLoad() {
    //
  }
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }

  func didSelectDoneButton() {
    coordinator?.showDeleteAccountConfirm()
  }
}

extension SettingsDeleteAccountPresenter: SettingsDeleteAccountInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
