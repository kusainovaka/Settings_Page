//
//  SettingsStorageProfilePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsStorageProfilePresenter {
  weak var view: SettingsStorageProfileViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var textRow = SettingsStorageProfileModel(type: .text, message: "91 165", size: " ", onSelected: { })
  private lazy var photosRow = SettingsStorageProfileModel(type: .photos, message: "1 609", size: Int.format(bytes: 1341234), onSelected: { })
  private lazy var voiceMessagesRow = SettingsStorageProfileModel(type: .voiceMessage, message: "113", size: Int.format(bytes: 1341234), onSelected: { })
  private lazy var gifsRow = SettingsStorageProfileModel(type: .gifs, message: "2", size: Int.format(bytes: 1341234), onSelected: { })
  private lazy var profileStorageSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [textRow, photosRow, voiceMessagesRow, gifsRow], header: nil, footer: nil)
  }()
    
  private lazy var manageHeader = SettingsEmptyHeaderModel(height: 44)
  private lazy var manageRow = SettingsTitleModel(text: "MANAGE", textColor: #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1), onSelected: {
    self.didManageView()
  })
  private lazy var manageSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [manageRow], header: manageHeader, footer: nil) }()
  private let interactor: SettingsStorageProfileInteractorInput

  init(interactor: SettingsStorageProfileInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsStorageProfilePresenter: SettingsStorageProfileViewOutput {
  func viewDidLoad() {
    view?.setSections([profileStorageSection, manageSection])
  }

  func didManageView() {
    view?.doSomething()
  }
    
  func didCloseAction() {
      coordinator?.dismissViewController()
  }
    
}

extension SettingsStorageProfilePresenter: SettingsStorageProfileInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
