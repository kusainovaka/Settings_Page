//
//  SettingsNetworkUsagePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 25.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsNetworkUsagePresenter {
  weak var view: SettingsNetworkUsageViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private lazy var messageHeader = SettingsHeaderSectionModel(text: "MESSAGES")
  private lazy var sentRow = SettingsTitleWithDetailModel(text: "SENT", detailText: "1217", onSelected: { } )
  private lazy var recievedRow = SettingsTitleWithDetailModel(text: "RECEIVED", detailText: "1076", onSelected: { } )
  private lazy var bytesSentRow = SettingsTitleWithDetailModel(text: "BYTES SENT", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var bytesRecievedRow = SettingsTitleWithDetailModel(text: "BYTES RECEIVED", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var messageSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [sentRow, recievedRow, bytesSentRow, bytesRecievedRow], header: messageHeader, footer: nil)
  }()
    
  private lazy var chatMediaHeader = SettingsHeaderSectionModel(text: "CHAT MEDIA")
  private lazy var chatMediaBytesSendRow = SettingsTitleWithDetailModel(text: "BYTES SENT", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var chatMediaBytesRecievedRow = SettingsTitleWithDetailModel(text: "BYTES RECEIVED", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var chatMediaSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [chatMediaBytesSendRow, chatMediaBytesRecievedRow], header: chatMediaHeader, footer: nil)
  }()
    
  private lazy var totalHeader = SettingsHeaderSectionModel(text: "CHAT MEDIA")
  private lazy var totalBytesSendRow = SettingsTitleWithDetailModel(text: "BYTES SENT", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var totalBytesRecievedRow = SettingsTitleWithDetailModel(text: "BYTES RECEIVED", detailText: Int.format(bytes: 1341234), onSelected: { } )
  private lazy var totalSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [totalBytesSendRow, totalBytesRecievedRow], header: totalHeader, footer: nil)
  }()
    
  private lazy var resetHeader = SettingsEmptyHeaderModel(height: 28)
  private lazy var resetRow = SettingsTitleModel(text: "RESET STATISTICS", textColor: #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1), onSelected: { })
  private lazy var resetFooter = SettingsEmptyHeaderModel(height: 28)
  private lazy var resetSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [resetRow], header: resetHeader, footer: resetFooter)
  }()

  private let interactor: SettingsNetworkUsageInteractorInput

  init(interactor: SettingsNetworkUsageInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsNetworkUsagePresenter: SettingsNetworkUsageViewOutput {
  func viewDidLoad() {
    view?.setSections([messageSection, chatMediaSection,totalSection, resetSection])
  }
}

extension SettingsNetworkUsagePresenter: SettingsNetworkUsageInteractorOutput {
  func didReceiveSomeData() {
        //
  }
}
