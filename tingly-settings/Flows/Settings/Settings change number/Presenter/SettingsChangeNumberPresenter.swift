//
//  SettingsChangeNumberPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeNumberPresenter {

  weak var view: SettingsChangeNumberViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsChangeNumberInteractorInput

  init(interactor: SettingsChangeNumberInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsChangeNumberPresenter: SettingsChangeNumberViewOutput {
  func viewDidLoad() {
    //
  }
    
  func didEnterCode() {
    coordinator?.showEnterCode()
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsChangeNumberPresenter: SettingsChangeNumberInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
