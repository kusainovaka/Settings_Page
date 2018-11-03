//
//  SettingsMobileNumberPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsMobileNumberPresenter {
    
  weak var view: SettingsMobileNumberViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var currentPhoneNumberHeader = SettingsHeaderSectionModel(text: "CONNECTED NUMBER")
  private lazy var currentPhoneNumberRow = SettingsTitleModel(text: "7 912 432 65 34", onSelected: { })
  private lazy var currentPhoneNumberSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [currentPhoneNumberRow], header: currentPhoneNumberHeader, footer: nil)
  }()
    
  private lazy var managePhoneNumberHedaer = SettingsHeaderSectionModel(text: "MANAGE")
  private lazy var managePhoneNumberRow = SettingsTitleWithDetailButtonModel(text: "CHANGE NUMBER",
                                                onSelected: { [weak coordinator] in
                                                coordinator?.showChangeNumberIntro() })
  private lazy var managePhoneNumberSection: BaseTableViewSection = {
        BaseTableViewSection(cellModels: [managePhoneNumberRow], header: managePhoneNumberHedaer, footer: nil)
  }()
    
  private var interactor: SettingsMobileNumberInteractorInput
  init(interactor: SettingsMobileNumberInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsMobileNumberPresenter: SettingsMobileNumberViewOutput {
  func viewDidLoad() {
    view?.setSections([currentPhoneNumberSection, managePhoneNumberSection])
  }
    
  func didSelectChangeNumber() {

  }
}

extension SettingsMobileNumberPresenter: SettingsMobileNumberInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
