//
//  SettingsInfoPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 28.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsInfoPresenter {
  
  weak var view: SettingsInfoViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  
  private lazy var languageHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var languageRow = SettingsTitleWithDetailButtonModel(text: "LANGUAGE",
                                                    onSelected: { [weak coordinator] in
                                                    coordinator?.showLanguageModule()} )
  private lazy var languageSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [languageRow], header: languageHeader, footer: nil)
  }()
  
  private lazy var manageConnectedHeader = SettingsHeaderSectionModel(text: "MANAGE CONNECTED")
  private lazy var mobileNumberRow = SettingsTitleWithDetailButtonModel(text: "MOBILE NUMBER",
                                                     onSelected: { [weak coordinator] in
                                                     coordinator?.showMobileNumber()
  })
  private lazy var activeDevicesRow = SettingsTitleWithDetailButtonModel(text: "ACTIVE DEVICES",
                                                    onSelected: { [weak coordinator] in
                                                    coordinator?.showActiveDevices() })
  private lazy var manageConnectedSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [mobileNumberRow, activeDevicesRow], header: manageConnectedHeader, footer: nil)
  }()
    
    private lazy var ifAwayFor = SettingsTitleWithDetailDescriptionModel(text: "IF AWAY FOR", detailText: "One month", onSelected: { } )
    private lazy var deleteNowRow = SettingsTitleWithColorModel(text: "DELETE NOW",
                                                        onSelected: {[weak coordinator] in
                                                        coordinator?.showDeleteAccount()} )
  private lazy var deleteAccountHeader = SettingsHeaderSectionModel(text: "DELETE MY ACCOUNT")
  private lazy var deleteAccountFooter = SettingsFooterSectionModel(text: "If you do not log in within this period of time, your account with all the information will be deleted.")
  private lazy var deleteAccountSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [ifAwayFor,deleteNowRow], header: deleteAccountHeader, footer: deleteAccountFooter)
  }()
  
  
  private let interactor: SettingsInfoInteractorInput
  
  init(interactor: SettingsInfoInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsInfoPresenter: SettingsInfoViewOutput {
  func viewDidLoad() {
    view?.setSections([languageSection, manageConnectedSection, deleteAccountSection])
  }
  
  func didSelectLanguage() {
    coordinator?.showLanguageModule()
  }
  
  func didSelectMobileNumber() {
    coordinator?.showMobileNumber()
  }
  
  func didSelectActiveDevices() {
    //
  }
  
  func didSelectAwayFor() {
    //
  }
  
  func didSelectDeleteAccount() {
    //
  }
}

extension SettingsInfoPresenter: SettingsInfoInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
