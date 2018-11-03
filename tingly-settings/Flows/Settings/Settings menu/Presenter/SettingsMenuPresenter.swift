//
//  SettingsMenuPresenter.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 23.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsMenuPresenter {
  
  weak var view: SettingsMenuViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var profileRow = SettingsProfileModel(name: "LAURA UNICORN", status: "In paradise!", image: #imageLiteral(resourceName: "oval"),
                                                     onSelected: { [weak coordinator] in
                                                        coordinator?.showAccountModule() })
  private lazy var profileSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [profileRow], header: nil, footer: nil)
  }()
  
  private lazy var mainMenuHeader = SettingsEmptyHeaderModel(height: 27)
  private lazy var accountRow = SettingsTitleWithImageModel(text: "ACCOUNT", image: #imageLiteral(resourceName: "account"),
                                                onSelected: { [weak coordinator] in
                                                coordinator?.showAccountModule() })
  
  private lazy var settingsRow = SettingsTitleWithImageModel(text: "MAIN SETTINGS", image: #imageLiteral(resourceName: "settings"),
                                                 onSelected: { [weak coordinator] in
                                                 coordinator?.showMainSettingsModule() })
  
  private lazy var avatarRow = SettingsTitleWithImageModel(text: "AVATAR", image: #imageLiteral(resourceName: "avatar"),
                                                 onSelected: { [weak coordinator] in
                                                 coordinator?.showAvatarModule() })
  
  private lazy var notificationtRow = SettingsTitleWithImageModel(text: "NOTIFICATIONS", image: #imageLiteral(resourceName: "notifications"),
                                                 onSelected: { [weak coordinator] in
                                                 coordinator?.showNotifications() })
  
  private lazy var privacyRow = SettingsTitleWithImageModel(text: "PRIVACY", image:#imageLiteral(resourceName: "privacy"),
                                                 onSelected: { [weak coordinator] in
                                                 coordinator?.showPrivacy() })
  private lazy var customiseRow = SettingsTitleWithImageModel(text: "CUSTOMISE", image: #imageLiteral(resourceName: "customisation"),
                                                 onSelected: { [weak coordinator] in
                                                coordinator?.showCustomise() })
  private lazy var dataStorageRow = SettingsTitleWithImageModel(text: "DATA & STORAGE", image: #imageLiteral(resourceName: "storage"),
                                                 onSelected: { [weak coordinator] in
                                                 coordinator?.showDataAndStorage() })
  private lazy var shareRow = SettingsTitleWithImageModel(text: "SHARE", image: #imageLiteral(resourceName: "share"), onSelected: {  })
  
  private lazy var mainMenuSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [accountRow,settingsRow, avatarRow,notificationtRow,privacyRow,customiseRow,dataStorageRow,shareRow], header: mainMenuHeader, footer: nil) }()
  
  private lazy var termsAndUseHeader = SettingsEmptyHeaderModel(height: 27)
  private lazy var termsAndUse = SettingsTitleWithDetailButtonModel(text: "TERMS OF USE AND FAQ",
                                                    onSelected: { [weak coordinator] in
                                                    coordinator?.showTermsOfUse() })
  private lazy var termsAndUseFooter = SettingsEmptyHeaderModel(height: 27)
  private lazy var termsAndUsedSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [termsAndUse], header: termsAndUseHeader, footer: termsAndUseFooter)
  }()
  
  private var interactor: SettingsMenuInteractorInput
  
  init(interactor: SettingsMenuInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsMenuPresenter: SettingsMenuViewOutput {
  func viewDidLoad() {
    view?.setSections([profileSection, mainMenuSection, termsAndUsedSection])
  }
  
  func didSelectAccount() {
    coordinator?.showAccountModule()
  }
  
  func didSelectMainSettings() {
    coordinator?.showMainSettingsModule()
  }
  
  func didSelectAvatar() {
    coordinator?.showAvatarModule()
  }
}

extension SettingsMenuPresenter: SettingsMenuInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
