//
//  SettingsCoordinatorInput.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation


protocol SettingsCoordinatorInput: class {
  
  func showMainSettingsModule()
  func showAccountModule()
  func showAvatarModule()
  func showLanguageModule()
  func showDeleteAccount()
  func showDeleteAccountConfirm()
  func showActiveDevices()
  func showMobileNumber()
  func showProfileAbout()
  func showProfileAboutText()
  func showChangeNumberIntro()
  func showChangeNumber()
  func showEnterCode()
  func showChangeAvatar(moduleOutput: SettingsChangeMyAvatarModuleOutput)
  func showSound()
  func showNotifications()
  func showPrivacy()
  func showLastSeen(moduleOutput: SettingsLastSeenPrivacyModuleOutput)
  func showProfilePhoto(moduleOutput: SettingsProfilePhotoModuleOutput)
  func showPrivacyAbout(moduleOutput: SettingsPrivacyAboutModuleOutput)
  func showPrivacyStatus(moduleOutput: SettingsPrivacyStatusModuleOutput)
  func showPrivacyBlocked(moduleOutput: SettingsPrivacyBlockedModuleOutput)
  func showCustomise()
  func showDataAndStorage()
  func showNetworkUsage()
  func showStorageUsage()
  func showStorageProfile()
  func showTermsOfUse()
  func showAskQuestion()
  func dismissViewController()
  //...
  
}
