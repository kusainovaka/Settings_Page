//
//  SettingsPrivacyAboutPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyAboutPresenter {
  weak var view: SettingsPrivacyAboutViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsPrivacyAboutModuleOutput?

  private lazy var aboutHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var everyoneRow = SettingsTitleSelectModel(text: "EVERYONE", onSelected: {
                                                [weak moduleOutput] in
                                                moduleOutput?.didChangePrivacyAbout(.everyone) })
  private lazy var myContactsRow = SettingsTitleSelectModel(text: "MY CONTACTS", onSelected: {
                                           [weak moduleOutput] in
                                            moduleOutput?.didChangePrivacyAbout(.myContacts) })
  private lazy var nobodyRow = SettingsTitleSelectModel(text: "NOBODY", onSelected: {
                                            [weak moduleOutput] in
                                             moduleOutput?.didChangePrivacyAbout(.nobody) })
  private lazy var aboutFooter = SettingsFooterSectionModel(text: "If you don’t share your Last Seen, you won’t be able to see other people’s Last Seen.")
    
  private lazy var aboutSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [everyoneRow, myContactsRow, nobodyRow], header: aboutHeader, footer: aboutFooter)
  }()

  private let interactor: SettingsPrivacyAboutInteractorInput

  init(interactor: SettingsPrivacyAboutInteractorInput,
     moduleOutput: SettingsPrivacyAboutModuleOutput) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsPrivacyAboutPresenter: SettingsPrivacyAboutViewOutput {
  func viewDidLoad() {
    view?.setSections([aboutSection])
  }
}

extension SettingsPrivacyAboutPresenter: SettingsPrivacyAboutInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}

