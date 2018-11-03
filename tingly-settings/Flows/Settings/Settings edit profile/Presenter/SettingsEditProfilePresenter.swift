//
//  SettingsEditProfilePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsEditProfilePresenter {
  weak var view: SettingsEditProfileViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var profileEditHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var profileEditRow = SettingsProfileEditModel(name: "LAURA UNICORN", image: #imageLiteral(resourceName: "oval"), onSelected: {  self.view?.editProfileAction() })
  private lazy var profileEditSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [profileEditRow], header: profileEditHeader, footer: nil)
  }()

  private lazy var phoneNumberHeader = SettingsHeaderSectionModel(text: "PHONE NUMBER")
  private lazy var phoneNumberRow = SettingsTitleModel(text: "33 654 65 12", onSelected: {  })
  private lazy var phoneNumberSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [phoneNumberRow], header: phoneNumberHeader, footer: nil)
  }()
    
  private lazy var aboutHeader = SettingsHeaderSectionModel(text: "ABOUT")
  private lazy var aboutRow = SettingsTitleWithDetailButtonModel(text: "In paradise!", titleColor: #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1),
                                                           onSelected: { [weak coordinator] in
                                                           coordinator?.showProfileAbout() })
  private lazy var aboutSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [aboutRow], header: aboutHeader, footer: nil)
  }()
    
  private let interactor: SettingsEditProfileInteractorInput

  init(interactor: SettingsEditProfileInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsEditProfilePresenter: SettingsEditProfileViewOutput {
  func viewDidLoad() {
    view?.setSections([profileEditSection, phoneNumberSection, aboutSection])
  }

  func didSelectAbout() {
   view?.doSomething()
  }

  func didSelectEditAvatar() {
   //
  }

  func didSelectChangeName() {
    //
  }
}

extension SettingsEditProfilePresenter: SettingsEditProfileInteractorOutput {
  func didReceiveSomeData() {
        //
    }
}
