//
//  SettingsStorageUsagePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsStorageUsagePresenter {
  weak var view: SettingsStorageUsageViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  
  private lazy var keepMediaRow = SettingsTitleWithDetailDescriptionModel(text: "KEEP MEDIA", detailText: "Forever", onSelected: { } )
  private lazy var keepMediaFooter = SettingsFooterSectionModel(text: "Cell description which explains the consequences of the above action. Cell description which explains the consequences of the above action.")
  private lazy var keepMediaSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [keepMediaRow], header: nil, footer: keepMediaFooter)
  }()
    
  private lazy var clearAllCachRow = SettingsTitleWithDetailButtonModel(text: "CLEAR ALL CACHE", onSelected: { } )
  private lazy var clearAllCachSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [clearAllCachRow], header: nil, footer: nil)
  }()
    
  private lazy var chatHeader = SettingsHeaderSectionModel(text: "CHATS")
  private lazy var firstRow = SettingsImageTitleWithDetailModel(text: "MOLLY GREEN", image: #imageLiteral(resourceName: "oval"), detailText: Int.format(bytes: 1341234),
                                                        onSelected: {[weak coordinator] in
                                                        coordinator?.showStorageProfile() })
  private lazy var secondRow = SettingsImageTitleWithDetailModel(text: "MONICA PERICH", image: #imageLiteral(resourceName: "oval"), detailText: Int.format(bytes: 1341234),
                                                        onSelected: {[weak coordinator] in
                                                        coordinator?.showStorageProfile() })
  private lazy var thirdRow = SettingsImageTitleWithDetailModel(text: "MONTY RAY", image: #imageLiteral(resourceName: "oval"), detailText: Int.format(bytes: 1341234),
                                                        onSelected: {[weak coordinator] in
                                                        coordinator?.showStorageProfile() })
  private lazy var fourthRow = SettingsImageTitleWithDetailModel(text: "MORELLA SUIT", image: #imageLiteral(resourceName: "oval"), detailText:Int.format(bytes: 1341234),
                                                        onSelected: {[weak coordinator] in
                                                        coordinator?.showStorageProfile() })
  private lazy var chatSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [firstRow, secondRow, thirdRow, fourthRow], header: chatHeader, footer: nil)
  }()
  private let interactor: SettingsStorageUsageInteractorInput

  init(interactor: SettingsStorageUsageInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsStorageUsagePresenter: SettingsStorageUsageViewOutput {
  func viewDidLoad() {
    view?.setSections([keepMediaSection, clearAllCachSection, chatSection])
  }
}

extension SettingsStorageUsagePresenter: SettingsStorageUsageInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
