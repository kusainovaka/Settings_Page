//
//  SettingsChangeNumberIntroPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeNumberIntroPresenter {

  weak var view: SettingsChangeNumberIntroViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsChangeNumberIntroInteractorInput

  init(interactor: SettingsChangeNumberIntroInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsChangeNumberIntroPresenter: SettingsChangeNumberIntroViewOutput {
  func viewDidLoad() {
        //
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
    
  func didSelectDoneButton() {
    coordinator?.showChangeNumber()
  }
}

extension SettingsChangeNumberIntroPresenter: SettingsChangeNumberIntroInteractorOutput {
  func didReceiveSomeData() {
        //
  }
}
