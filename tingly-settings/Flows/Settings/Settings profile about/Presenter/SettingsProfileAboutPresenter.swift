//
//  SettingsProfileAboutPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsProfileAboutPresenter {
    
  weak var view: SettingsProfileAboutViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private var isEditing: Bool = false {
     didSet {
        
    }
  }
    
  private lazy var currentlySetHeader = SettingsHeaderSectionModel(text: "CURRENTLY SET TO")
  private lazy var currentlySetRow = SettingsTitleWithDetailButtonModel(text: "In paradise!",              titleColor: #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1),
                                                        onSelected: { [weak coordinator] in
                                                        coordinator?.showProfileAboutText() })
  private lazy var currentlySetSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [currentlySetRow], header: currentlySetHeader, footer: nil)
    }()
    
  private lazy var selectNewHeader = SettingsHeaderSectionModel(text: "SELECT A NEW ONE")
    private lazy var availableRow = SettingsTitleChooseModel(text: "AVAILABLE", onSelected: {  }, chooseType: isEditing)
    private lazy var busyRow = SettingsTitleChooseModel(text: "BUSY", onSelected: { }, isSelected: true, chooseType: isEditing)
    private lazy var schoolRow = SettingsTitleChooseModel(text: "AT SCHOOL", onSelected: { }, chooseType: isEditing)
    private lazy var cinemaRow = SettingsTitleChooseModel(text: "AT THE CINEMA", onSelected: { }, chooseType: isEditing)
    private lazy var workRow = SettingsTitleChooseModel(text: "WORKING", onSelected: { }, chooseType: isEditing)
    private lazy var lowBatteryRow = SettingsTitleChooseModel(text: "LOW BATTERY", onSelected: { }, chooseType: isEditing)
    private lazy var gymRow = SettingsTitleChooseModel(text: "IN GYM", onSelected: { }, chooseType: isEditing)
    private lazy var emergencyCallRow = SettingsTitleChooseModel(text: "ONLY EMERGENCY CALLS", onSelected: { }, chooseType: isEditing)
  private lazy var selectNewSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [availableRow, busyRow, schoolRow, cinemaRow, workRow, lowBatteryRow, gymRow, emergencyCallRow], header: selectNewHeader, footer: nil)
  }()
    
  private var interactor: SettingsProfileAboutInteractorInput

  init(interactor: SettingsProfileAboutInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsProfileAboutPresenter: SettingsProfileAboutViewOutput {
  func viewDidLoad() {
    view?.setSections([currentlySetSection, selectNewSection])
  }
    
  func didCurrentlySetTo() {
  //
  }
    
  func setEditing() {
    isEditing = true
  }
}

extension SettingsProfileAboutPresenter: SettingsProfileAboutInteractorOutput {
  func didReceiveSomeData() {
   //
  }
}
