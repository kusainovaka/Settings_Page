//
//  SettingsAskQuestionPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAskQuestionPresenter {

  weak var view: SettingsAskQuestionViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private var interactor: SettingsAskQuestionInteractorInput

  init(interactor: SettingsAskQuestionInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsAskQuestionPresenter: SettingsAskQuestionViewOutput {
  func viewDidLoad() {
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
    
  func didSelectDoneButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsAskQuestionPresenter: SettingsAskQuestionInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
