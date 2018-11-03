//
//  SettingsAboutTextPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAboutTextPresenter {

  weak var view: SettingsAboutTextViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  
  private var interactor: SettingsAboutTextInteractorInput

  init(interactor: SettingsAboutTextInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsAboutTextPresenter: SettingsAboutTextViewOutput {
  func viewDidLoad() {
    //
  }
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }

  func didSelectDoneButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsAboutTextPresenter: SettingsAboutTextInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
