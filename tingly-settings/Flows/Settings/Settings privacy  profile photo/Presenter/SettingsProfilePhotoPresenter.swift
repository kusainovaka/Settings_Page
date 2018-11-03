//
//  SettingsProfilePhotoPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsProfilePhotoPresenter {
  weak var view: SettingsProfilePhotoViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsProfilePhotoModuleOutput?

  private lazy var profilePhotoHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var everyoneRow = SettingsTitleSelectModel(text: "EVERYONE", onSelected: {
                                                    [weak moduleOutput] in
                                                    moduleOutput?.didChangeProfilePhoto(.everyone) })
  private lazy var myContactsRow = SettingsTitleSelectModel(text: "MY CONTACTS", onSelected: {
                                                [weak moduleOutput] in
                                                moduleOutput?.didChangeProfilePhoto(.myContacts) })
  private lazy var nobodyRow = SettingsTitleSelectModel(text: "NOBODY", onSelected: {
                                                    [weak moduleOutput] in
                                                    moduleOutput?.didChangeProfilePhoto(.nobody)
  })
  private lazy var profilePhotoFooter = SettingsFooterSectionModel(text: "If you don’t share your Last Seen, you won’t be able to see other people’s Last Seen.")
    
  private lazy var profilePhotoSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [everyoneRow, myContactsRow, nobodyRow], header: profilePhotoHeader, footer: profilePhotoFooter)
  }()

  private let interactor: SettingsProfilePhotoInteractorInput

  init(interactor: SettingsProfilePhotoInteractorInput,moduleOutput: SettingsProfilePhotoModuleOutput) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsProfilePhotoPresenter: SettingsProfilePhotoViewOutput {
  func viewDidLoad() {
    view?.setSections([profilePhotoSection])
  }
}

extension SettingsProfilePhotoPresenter: SettingsProfilePhotoInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}

