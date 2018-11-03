//
//  SettingsDeleteAccountConfirmPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsDeleteAccountConfirmPresenter {

  weak var view: SettingsDeleteAccountConfirmViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsDeleteAccountConfirmInteractorInput
  init(interactor: SettingsDeleteAccountConfirmInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsDeleteAccountConfirmPresenter: SettingsDeleteAccountConfirmViewOutput {
  func viewDidLoad() {
    //
  }
    
  func didSelectDoneButton() {
    coordinator?.showDeleteAccount()
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsDeleteAccountConfirmPresenter: SettingsDeleteAccountConfirmInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
