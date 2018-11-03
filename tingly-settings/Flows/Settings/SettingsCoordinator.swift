//
//  SettingsCoordinator.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 27.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
  
  var finishFlow: (() -> Void)?
  
  private let router: Router
  init(router: Router) {
    self.router = router
  }
  
  override func start() {
    showMenuSettingsModule()
  }
}

extension SettingsCoordinator: SettingsCoordinatorInput {
    
  func showMenuSettingsModule() {
    let module = SettingsMenuAssembly.makeSettingsMenu(coordinator: self)
    router.setRootModule(module, hideBar: true, animated: true)
  }
    
  func showMainSettingsModule() {
    let module = SettingsInfoAssembly.makeSettingsInfo(coordinator: self)
    router.push(module, hideBar: false)
  }
  
  func showAvatarModule() {
  let module = SettingsAvatarAssembly.makeSettingsAvatar(coordinator: self)
  router.push(module, hideBar: false)
  }
  
  func showAccountModule() {
    let module = SettingsEditProfileAssembly.makeEditProfile(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showProfileAbout() {
    let module = SettingsProfileAboutAssembly.makeSettingsProfileAbout(coordinator: self)
    router.push(module, hideBar: false)
  }

  func showProfileAboutText() {
    let module = SettingsAboutTextAssembly.makeSettingsAboutText(coordinator: self)
    router.present(module)
  }
    
  func showLanguageModule() {
    let module = SettingsLanguageAssembly.makeSettingsLanguage(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showDeleteAccount() {
    let module = SettingsDeleteAccountAssembly.makeDeleteAccount(coordinator: self)
    router.present(module)
  }
    
  func showDeleteAccountConfirm() {
    let module = SettingsDeleteAccountConfirmAssembly.makeDeleteAccountConfirm(coordinator: self)
    router.present(module)
  }
    
  func showActiveDevices() {
    let module = SettingsActiveDevicesAssembly.makeSettingsActiveDevices(coordinator: self)
    router.push(module, hideBar: false)
  }

  func showMobileNumber() {
    let module = SettingsMobileNumberAssembly.makeSettingsMobileNumber(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showChangeNumberIntro() {
    let module = SettingsChangeNumberIntroAssembly.makeSettingsChangeNumberIntro(coordinator: self)
    router.present(module)
  }

  func showChangeNumber() {
    let module = SettingsChangeNumberAssembly.makeSettingsChangeNumber(coordinator: self)
    router.present(module)
  }
    
  func showEnterCode() {
    let module = SettingsEnterCodeAssembly.makeSettingsEnterCode(coordinator: self)
    router.present(module)
  }
    
  func showChangeAvatar(moduleOutput: SettingsChangeMyAvatarModuleOutput) {
    let module = SettingsChangeAvatarAssembly.makeSettingsChangeAvatar(coordinator: self, output: moduleOutput)
    router.present(module)
  }
    
  func showNotifications() {
    let module = SettingsNotificationsAssembly.makeSettingsNotifications(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showSound() {
    let module = SettingsSoundAssembly.makeSettingsSound(coordinator: self)
    router.present(module)
  }
    
  func showPrivacy() {
    let module = SettingsPrivacyAssembly.makeSettingsPrivacy(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showLastSeen(moduleOutput: SettingsLastSeenPrivacyModuleOutput) {
    let module = SettingsLastSeenAssembly.makeLastSeen(coordinator: self, output: moduleOutput)
    router.push(module, hideBar: false)
  }
    
  func showProfilePhoto(moduleOutput: SettingsProfilePhotoModuleOutput) {
    let module = SettingsProfilePhotoAssembly.makeProfilePhoto(coordinator: self, output: moduleOutput)
    router.push(module, hideBar: false)
  }
    
  func showPrivacyAbout(moduleOutput: SettingsPrivacyAboutModuleOutput) {
    let module = SettingsPrivacyAboutAssembly.makePrivacyAbout(coordinator: self, output: moduleOutput)
    router.push(module, hideBar: false)
  }
    
  func showPrivacyStatus(moduleOutput: SettingsPrivacyStatusModuleOutput) {
    let module = SettingsPrivacyStatusAssembly.makePrivacyStatus(coordinator: self, output: moduleOutput)
    router.push(module, hideBar: false)
  }
    
  func showPrivacyBlocked(moduleOutput: SettingsPrivacyBlockedModuleOutput) {
    let module = SettingsPrivacyBlockedAssembly.makePrivacyBlockedAssembly(coordinator: self, output: moduleOutput)
    router.push(module, hideBar: false)
  }
    
  func showCustomise() {
    let module = SettingsCustomiseAssembly.makeCustomise(coordinator: self)
    router.push(module, hideBar: false)
  }
   
  func showDataAndStorage() {
    let module = SettingsDataAndStorageAssembly.makeSettingsDataAndStorage(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showNetworkUsage() {
    let module = SettingsNetworkUsageAssembly.makeSettingsNetworkUsage(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showStorageUsage() {
    let module = SettingsStorageUsageAssembly.makeSettingsStorageUsage(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showStorageProfile() {
    let module = SettingsStorageProfileAssembly.makeSettingsStorageProfile(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showTermsOfUse() {
    let module = SettingsTermsOfUseAssembly.makeSettingsTermsOfUse(coordinator: self)
    router.push(module, hideBar: false)
  }
    
  func showAskQuestion() {
    let module = SettingsAskQuestionAssembly.makeSettingsAskQuestion(coordinator: self)
    router.present(module)
  }
    
  func dismissViewController() {
     router.dismissModule()
  }
}
