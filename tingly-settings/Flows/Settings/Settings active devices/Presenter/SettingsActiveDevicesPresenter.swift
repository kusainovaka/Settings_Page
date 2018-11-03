//
//  SettingsActiveDevicesPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 14.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation


class SettingsActiveDevicesPresenter {

  weak var view: SettingsActiveDevicesViewInput?
  weak var coordinator: SettingsCoordinatorInput?
    
  private lazy var currentDevicesHeader = SettingsHeaderSectionModel(text: "CURRENT DEVICE")
  private lazy var currentDeviceRow = SettingsActiveDevicesModel(name: "IPHONE 6",
                                                    platformText: "Border v.1.0, IOS 10.3.1",
                                                    status: "Online",
                                                    country: "77.246.233.22 - Russia",
                                                    onSelected: { })
  private lazy var currentDeviceSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [currentDeviceRow], header:  currentDevicesHeader, footer: nil) }()

    private lazy var disconnectDeviceRow = SettingsTitleModel(text: "DISCONNECT ALL OTHER DEVICES", textColor: #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1), onSelected: { self.didSelectNone() })
  private lazy var disconnectDeviceFooter = SettingsFooterSectionModel(text: "Log out all devices except this one.")
  private lazy var disconnectDeviceSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [disconnectDeviceRow], header:  nil, footer: disconnectDeviceFooter) }()
    
  private lazy var recentlyActiveHeader = SettingsHeaderSectionModel(text: "RECENTLY ACTIVE")
  private lazy var recentlyActiveFirst = SettingsActiveDevicesModel(name: "IPHONE SE",
                                                platformText: "Border v.1.0, IOS 10.3.1",
                                                status: "Online",
                                                country: "77.246.233.22 - Russia",
                                                onSelected: { })
  private lazy var recentlyActiveSecond = SettingsActiveDevicesModel(name: "MAC",
                                                platformText: "Border v.1.0, IOS 10.3.1",
                                                status: "Online",
                                                country: "77.246.233.22 - Russia",
                                                onSelected: { })
  private lazy var recentlyActiveSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [recentlyActiveFirst,recentlyActiveSecond], header:  recentlyActiveHeader, footer: nil) }()
    
    
  private var interactor: SettingsActiveDevicesInteractorInput
  init(interactor: SettingsActiveDevicesInteractorInput) {
    self.interactor = interactor
  }
}

extension SettingsActiveDevicesPresenter: SettingsActiveDevicesViewOutput {
  func viewDidLoad() {
    view?.setSections([currentDeviceSection, disconnectDeviceSection, recentlyActiveSection])
  }

  func didSelectNone() {
    view?.showLoading()
  }
}

extension SettingsActiveDevicesPresenter: SettingsActiveDevicesInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
