//
//  SettingsPrivacyBlockedPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 30.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyBlockedPresenter {
  weak var view: SettingsPrivacyBlockedViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsPrivacyBlockedModuleOutput?

  private lazy var firstRow = SettingsImageTitleWithDeleteSectionModel(text: "MOLLY GREEN", image: #imageLiteral(resourceName: "oval"),
                                                    onSelected: { })
  private lazy var secondRow = SettingsImageTitleWithDeleteSectionModel(text: "MONICA PERICH", image: #imageLiteral(resourceName: "oval"),
                                                        onSelected: { })
  private lazy var thirdRow = SettingsImageTitleWithDeleteSectionModel(text: "968 007 65 48", image: #imageLiteral(resourceName: "oval"),
                                                        onSelected: { })
  private lazy var blockedListSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [firstRow, secondRow, thirdRow], header: nil, footer: nil) }()

  private lazy var addNewHeader = SettingsEmptyHeaderModel(height: 53)
  private lazy var addNewRow = SettingsTitleWithImageModel(text:"ADD NEW",image: #imageLiteral(resourceName: "addNew"), textColor: #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1), onSelected: { })
  private lazy var addNewFooter = SettingsFooterSectionModel(text: "Blocked contacts will no longer be able to call you or send you message.")
  private lazy var addNewSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [addNewRow], header: addNewHeader, footer: addNewFooter) }()

  private let interactor: SettingsPrivacyBlockedInteractorInput

  init(interactor: SettingsPrivacyBlockedInteractorInput, moduleOutput: SettingsPrivacyBlockedModuleOutput) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsPrivacyBlockedPresenter: SettingsPrivacyBlockedViewOutput {
  func viewDidLoad() {
    view?.setSections([blockedListSection, addNewSection])
    moduleOutput?.didChangeBlockedCount(10)
  }
}

extension SettingsPrivacyBlockedPresenter: SettingsPrivacyBlockedInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
