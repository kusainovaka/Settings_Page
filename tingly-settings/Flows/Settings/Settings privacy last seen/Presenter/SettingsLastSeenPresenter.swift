//
//  SettingsLastSeenPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsLastSeenPresenter {
  weak var view: SettingsLastSeenViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsLastSeenPrivacyModuleOutput?

  private lazy var lastSeenHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var everyoneRow = SettingsTitleSelectModel(text: "EVERYONE", onSelected: {
                                                    [weak moduleOutput] in
                                                    moduleOutput?.didChangeLastSeen(.everyone)
  }, isSelected: false)
  private lazy var myContactsRow = SettingsTitleSelectModel(text: "MY CONTACTS", onSelected: {
                                                    [weak moduleOutput] in
                                                    moduleOutput?.didChangeLastSeen(.myContacts)
  }, isSelected: false)
  private lazy var nobodyRow = SettingsTitleSelectModel(text: "NOBODY", onSelected: {
                                                    [weak moduleOutput] in
                                                    moduleOutput?.didChangeLastSeen(.nobody)
  }, isSelected: false)
  
  private lazy var lastSeenFooter = SettingsFooterSectionModel(text: "If you don’t share your Last Seen, you won’t be able to see other people’s Last Seen.")
  private lazy var lastSeenSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [everyoneRow, myContactsRow, nobodyRow], header: lastSeenHeader, footer: lastSeenFooter)
  }()

  private let interactor: SettingsLastSeenInteractorInput

  init(interactor: SettingsLastSeenInteractorInput,
       moduleOutput: SettingsLastSeenPrivacyModuleOutput) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsLastSeenPresenter: SettingsLastSeenViewOutput {
  func viewDidLoad() {
    view?.setSections([lastSeenSection])
  }
    
}

extension SettingsLastSeenPresenter: SettingsLastSeenInteractorOutput {
  func didReceiveSomeData() {
    //
  }
    
}
