//
//  SettingsSoundPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsSoundPresenter {
    
  weak var view: SettingsSoundViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var soundHeader = SettingsHeaderSectionModel(text: "SELECT A NEW ONE")
  private lazy var noneRow = SettingsTitleSelectModel(text: "NONE", onSelected: { })
  private lazy var noteDefaultRow = SettingsTitleSelectModel(text: "NOTE Default", onSelected: { })
  private lazy var auroraRow = SettingsTitleSelectModel(text: "AURORA", onSelected: { })
  private lazy var bambooRow = SettingsTitleSelectModel(text: "BAMBOO", onSelected: { })
  private lazy var chordRow = SettingsTitleSelectModel(text: "CHORD", onSelected: { })
  private lazy var circlesRow = SettingsTitleSelectModel(text: "CIRCLES", onSelected: { })
  private lazy var completeRow = SettingsTitleSelectModel(text: "COMPLETE", onSelected: { })
  private lazy var helloRow = SettingsTitleSelectModel(text: "HELLO", onSelected: { })
  private lazy var inputRow = SettingsTitleSelectModel(text: "INPUT", onSelected: { })
  private lazy var keysRow = SettingsTitleSelectModel(text: "KEYS", onSelected: { })
  private lazy var soundSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [noneRow, noteDefaultRow, auroraRow,bambooRow,chordRow, circlesRow, completeRow, helloRow, inputRow, keysRow], header: soundHeader, footer: nil)
   }()
    
  private var interactor: SettingsSoundInteractorInput
    
  init(interactor: SettingsSoundInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsSoundPresenter: SettingsSoundViewOutput {
  func viewDidLoad() {
    view?.setSections([soundSection])
  }
    
  func didSelectNone() {
    //
  }
    
  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
    
  func didSelectDoneButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsSoundPresenter: SettingsSoundInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
