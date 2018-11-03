//
//  SettingsPrivacyPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 18.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsPrivacyPresenter {
  weak var view: SettingsPrivacyViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var privacyHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var privacyLastSeenRow = SettingsTitleWithDetailDescriptionModel(text: "LAST SEEN", detailText: "Nobody",
                                        onSelected: { [weak coordinator] in
                                        coordinator?.showLastSeen(moduleOutput: self)})

   private lazy var profilePhotoRow = SettingsTitleWithDetailDescriptionModel(text: "PROFILE PHOTO", detailText: "Everyone",
                                        onSelected: { [weak coordinator] in
                                        coordinator?.showProfilePhoto(moduleOutput: self) })

   private lazy var aboutRow = SettingsTitleWithDetailDescriptionModel(text: "ABOUT", detailText: "Nobody",
                                        onSelected: { [weak coordinator] in
                                        coordinator?.showPrivacyAbout(moduleOutput: self) })

   private lazy var statusRow = SettingsTitleWithDetailDescriptionModel(text: "STATUS", detailText: "My Contacts",
                                        onSelected: { [weak coordinator] in
                                        coordinator?.showPrivacyStatus(moduleOutput: self) })

  private lazy var blockHeader = SettingsEmptyHeaderModel(height: 52)
  private lazy var blockRow = SettingsTitleWithDetailDescriptionModel(text: "BLOCKED", detailText: "4 contacts",
                                        onSelected: {[weak coordinator] in
                                            coordinator?.showPrivacyBlocked(moduleOutput: self)} )
  private lazy var blockFooter = SettingsFooterSectionModel(text: "List of chats where you are sharing your life location.")

  private let interactor: SettingsPrivacyInteractorInput

  init(interactor: SettingsPrivacyInteractorInput) {
    self.interactor = interactor
  }
  
  private func buildSections() -> [BaseTableViewSection] {
    let privacy = BaseTableViewSection(cellModels: [privacyLastSeenRow, profilePhotoRow, aboutRow, statusRow], header: privacyHeader, footer: nil)
    let block = BaseTableViewSection(cellModels: [blockRow], header: blockHeader, footer: blockFooter)
    return [privacy, block]
  }
}

extension SettingsPrivacyPresenter: SettingsPrivacyViewOutput {
  func viewDidLoad() {
    view?.setSections(buildSections())
  }

  func didSelectAbout() {
    //
  }

  func didSelectLastSeen() {
    //
  }

  func didSelectProfilePhoto() {
    //
  }

  func didSelectStatus() {
    //
  }

  func didSelectBlocked() {
    //
  }
}

extension SettingsPrivacyPresenter: SettingsPrivacyInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}


extension SettingsPrivacyPresenter: SettingsLastSeenPrivacyModuleOutput {
  func didChangeLastSeen(_ lastSeen: LastSeenPrivacy) {
    switch lastSeen {
    case .everyone:
      privacyLastSeenRow.detailText = "Everyone"
      
    case .myContacts:
      privacyLastSeenRow.detailText = "My Contacts"
      
    case .nobody:
      privacyLastSeenRow.detailText = "Nobody"
    }
    view?.setSections(buildSections())
  }
}

extension SettingsPrivacyPresenter: SettingsProfilePhotoModuleOutput {
  func didChangeProfilePhoto(_ lastSeen: LastSeenPrivacy) {
    switch lastSeen {
    case .everyone:
        profilePhotoRow.detailText = "Everyone"
        
    case .myContacts:
        profilePhotoRow.detailText = "My Contacts"
        
    case .nobody:
        profilePhotoRow.detailText = "Nobody"
    }
    view?.setSections(buildSections())
  }
}

extension SettingsPrivacyPresenter: SettingsPrivacyAboutModuleOutput {
  func didChangePrivacyAbout(_ lastSeen: LastSeenPrivacy) {
    switch lastSeen {
    case .everyone:
        aboutRow.detailText = "Everyone"
        
    case .myContacts:
        aboutRow.detailText = "My Contacts"
        
    case .nobody:
        aboutRow.detailText = "Nobody"
    }
    view?.setSections(buildSections())
  }
}

extension SettingsPrivacyPresenter: SettingsPrivacyStatusModuleOutput {
  func didChangePrivacyStatus(_ lastSeen: LastSeenPrivacy) {
    switch lastSeen {
    case .everyone:
        statusRow.detailText = "Everyone"
        
    case .myContacts:
        statusRow.detailText = "My Contacts"
        
    case .nobody:
        statusRow.detailText = "Nobody"
    }
    view?.setSections(buildSections())
  }
}

extension SettingsPrivacyPresenter: SettingsPrivacyBlockedModuleOutput {
  func didChangeBlockedCount(_ blockedCount: Int) {
        blockRow.detailText = "\(blockedCount) contacts"
        view?.setSections(buildSections())
  }
}
