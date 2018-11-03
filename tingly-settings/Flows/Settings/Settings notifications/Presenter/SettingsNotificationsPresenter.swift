//
//  SettingsNotificationsPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsNotificationsPresenter {

  weak var view: SettingsNotificationsViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private lazy var messagesHeader = SettingsHeaderSectionModel(text: "MESSAGES")
  private lazy var messagesShowPreviewRow = SettingsTitleSwitcherModel(title: "SHOW PREVIEW", isActive: true)
  private lazy var messagesVibrateRow = SettingsTitleSwitcherModel(title: "VIBRATE")
  private lazy var messagesSoundRow = SettingsTitleWithDetailButtonModel(text: "SOUND",
                                                                   onSelected: { [weak coordinator] in
                                                                   coordinator?.showSound() })
  private lazy var messagesSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [messagesShowPreviewRow,messagesVibrateRow, messagesSoundRow ], header: messagesHeader, footer: nil)
  }()
    
  private lazy var groupChatHeader = SettingsHeaderSectionModel(text: "GROUP CHATS")
  private lazy var groupChatShowPreviewRow = SettingsTitleSwitcherModel(title: "SHOW PREVIEW", isActive: true)
  private lazy var groupChatVibrateRow = SettingsTitleSwitcherModel(title: "VIBRATE")
  private lazy var groupChatSoundRow = SettingsTitleWithDetailButtonModel(text: "SOUND",
                                                                      onSelected: { [weak coordinator] in
                                                                      coordinator?.showSound() })
  private lazy var groupChatSection: BaseTableViewSection = {
        BaseTableViewSection(cellModels: [groupChatShowPreviewRow ,groupChatVibrateRow, groupChatSoundRow ], header: groupChatHeader, footer: nil)
    }()
    
  private lazy var inAppHeader = SettingsHeaderSectionModel(text: "IN-APP")
  private lazy var inAppShowPreviewRow = SettingsTitleSwitcherModel(title: "SHOW PREVIEW", isActive: true)
  private lazy var inAppVibrateRow = SettingsTitleSwitcherModel(title: "VIBRATE")
  private lazy var inAppSoundRow = SettingsTitleWithDetailButtonModel(text: "SOUND",
                                                                  onSelected: { [weak coordinator] in
                                                                  coordinator?.showSound() })
  private lazy var inAppSection: BaseTableViewSection = {
        BaseTableViewSection(cellModels: [inAppShowPreviewRow ,inAppVibrateRow, inAppSoundRow ], header: inAppHeader, footer: nil)
    }()
    
  private let resetNotificationHeader = SettingsEmptyHeaderModel(height: 52)
  private let resetRow = SettingsTitleModel(text: "RESET NOTIFICATION SETTINGS", textColor: #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1), onSelected: { })
  private let resetNotificationFooter = SettingsFooterSectionModel(text: "Reset all notifications settings, including custom notification settings for your chats.")
  private lazy var resetNotificationSection: BaseTableViewSection =  {
        BaseTableViewSection(cellModels: [resetRow], header: resetNotificationHeader, footer: resetNotificationFooter)
    }()
    
  private var interactor: SettingsNotificationsInteractorInput
    
  init(interactor: SettingsNotificationsInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsNotificationsPresenter: SettingsNotificationsViewOutput {
  func viewDidLoad() {
    view?.setSections([messagesSection, groupChatSection, inAppSection, resetNotificationSection])
  }

  func didSelectMessageSound() {
    //
  }

  func didSelectGroupChatSound() {
    //
  }

  func didSelectInappSound() {
    //
  }

  func didSelectResetNotifications() {
    //
  }
}

extension SettingsNotificationsPresenter: SettingsNotificationsInteractorOutput {
  func didReceiveSomeData() {
        //
  }
}
