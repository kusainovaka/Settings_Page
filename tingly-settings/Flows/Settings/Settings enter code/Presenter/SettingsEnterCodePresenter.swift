//
//  SettingsEnterCodePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 16.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsEnterCodePresenter {

  weak var view: SettingsEnterCodeViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsEnterCodeInteractorInput

  init(interactor: SettingsEnterCodeInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsEnterCodePresenter: SettingsEnterCodeViewOutput {
  func viewDidLoad() {
    //
  }
    
  func didEditPhoneNumber(){
    coordinator?.showChangeNumber()
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsEnterCodePresenter: SettingsEnterCodeInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
