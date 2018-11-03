//
//  SettingsPrivacyStatusPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation


class SettingsPrivacyStatusPresenter {
  weak var view: SettingsPrivacyStatusViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsPrivacyStatusModuleOutput?

  private lazy var statusHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var everyoneRow = SettingsTitleSelectModel(text: "EVERYONE", onSelected: {
                                        [weak moduleOutput] in
                                        moduleOutput?.didChangePrivacyStatus(.everyone) })
  private lazy var myContactsRow = SettingsTitleSelectModel(text: "MY CONTACTS", onSelected: {
                                        [weak moduleOutput] in
                                        moduleOutput?.didChangePrivacyStatus(.myContacts) })
  private lazy var nobodyRow = SettingsTitleSelectModel(text: "NOBODY", onSelected: {
                                        [weak moduleOutput] in
                                        moduleOutput?.didChangePrivacyStatus(.nobody) })
  private lazy var statusFooter = SettingsFooterSectionModel(text: "If you don’t share your Last Seen, you won’t be able to see other people’s Last Seen.")
  private lazy var statusSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [everyoneRow, myContactsRow, nobodyRow], header: statusHeader, footer: statusFooter)
}()

  private let interactor: SettingsPrivacyStatusInteractorInput

  init(interactor: SettingsPrivacyStatusInteractorInput,
       moduleOutput: SettingsPrivacyStatusModuleOutput) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsPrivacyStatusPresenter: SettingsPrivacyStatusViewOutput {
  func viewDidLoad() {
    view?.setSections([statusSection])
  }
}

extension SettingsPrivacyStatusPresenter: SettingsPrivacyStatusInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}

