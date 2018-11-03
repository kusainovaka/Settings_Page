//
//  SettingsLanguagePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsLanguagePresenter {
    
  weak var view: SettingsLanguageViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private lazy var languageHeader = SettingsHeaderSectionModel(text: "SELECT LANGUAGE")
  private lazy var englishRow = SettingsTitleSelectModel(text: "ENGLISH", onSelected: { })
  private lazy var frenchRow = SettingsTitleSelectModel(text: "FRENCH", onSelected: { })
  private lazy var germanRow = SettingsTitleSelectModel(text: "GERMAN", onSelected: { })
  private lazy var italianRow = SettingsTitleSelectModel(text: "ITALIAN", onSelected: { })
  private lazy var spanishRow = SettingsTitleSelectModel(text: "SPANISH", onSelected: { })
  private lazy var russianRow = SettingsTitleSelectModel(text: "RUSSIAN", onSelected: { })
  private lazy var languagesSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [englishRow, frenchRow, germanRow,italianRow, spanishRow, russianRow], header: languageHeader, footer: nil)
  }()

  private var interactor: SettingsLanguageInteractorInput
  init(interactor: SettingsLanguageInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsLanguagePresenter: SettingsLanguageViewOutput {
  func viewDidLoad() {
  view?.setSections([languagesSection])
  }
}

extension SettingsLanguagePresenter: SettingsLanguageInteractorOutput {
  func didReceiveSomeData() {
        //
  }
}
