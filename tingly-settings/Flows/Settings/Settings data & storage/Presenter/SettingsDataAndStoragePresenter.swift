//
//  SettingsDataAndStoragePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation
class SettingsDataAndStoragePresenter {

  weak var view: SettingsDataAndStorageViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private lazy var downloadHeader = SettingsHeaderSectionModel(text: "AUTOMATIC PHOTO DOWNLOAD")

  private lazy var messageRow = SettingsTitleSwitcherModel(title: "MESSAGES")
  private lazy var groupRow = SettingsTitleSwitcherModel(title: "GROUP CHATS")
  private lazy var automaticDownloadSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [messageRow,groupRow], header: downloadHeader, footer: nil)
  }()

  private lazy var otherHeader = SettingsHeaderSectionModel(text: "OTHER")
  private lazy var saveRow = SettingsTitleSwitcherModel(title: "SAVE IMAGES TO PHOTO LIBRARY")
  private lazy var saveMediaSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [saveRow], header: otherHeader, footer: nil)
  }()

  private lazy var usageHeader = SettingsEmptyHeaderModel(height: 52)
  private lazy var storageUsageRow = SettingsTitleWithDetailButtonModel(text: "STORAGE USAGE", 
                                                onSelected: { [weak coordinator] in
                                                coordinator?.showStorageUsage()
  })
  private lazy var networkUsageRow = SettingsTitleWithDetailButtonModel(text: "NETWORK USAGE",
                                                onSelected: { [weak coordinator] in
                                                coordinator?.showNetworkUsage()
  })
  private lazy var usageSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [storageUsageRow,networkUsageRow ], header: usageHeader, footer: nil)
  }()

  private var interactor: SettingsDataAndStorageInteractorInput

  init(interactor: SettingsDataAndStorageInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsDataAndStoragePresenter: SettingsDataAndStorageViewOutput {
 
    
  func viewDidLoad() {
    view?.setSections([automaticDownloadSection,saveMediaSection,usageSection])
  }
  func didSelectStorageUsage() {
    //
  }
    
  func didSelectNetworkUsage() {
    //
  }

}

extension SettingsDataAndStoragePresenter: SettingsDataAndStorageInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
