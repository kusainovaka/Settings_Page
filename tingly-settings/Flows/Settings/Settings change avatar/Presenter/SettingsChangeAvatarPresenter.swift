//
//  SettingsChangeAvatarPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsChangeAvatarPresenter {
    
  weak var view: SettingsChangeAvatarViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  private weak var moduleOutput: SettingsChangeMyAvatarModuleOutput?
    
  private lazy var changeAvatarHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var changeAvatarFirstRow = SettingsChangeAvatarModel(phoneNumber: "7 968 214 08 16", image: #imageLiteral(resourceName: "oval"),
                                            onSelected: { [weak moduleOutput] in
                                            moduleOutput?.didChangeAvatar(select: .firstProfile) })
  private lazy var changeAvatarSecondRow = SettingsChangeAvatarModel(phoneNumber: "7 903 765 97 20", image: #imageLiteral(resourceName: "oval"),
                                            onSelected: { [weak moduleOutput] in
                                            moduleOutput?.didChangeAvatar(select: .secondProfile) })
    private lazy var changeAvatarThirdRow = SettingsChangeAvatarModel(phoneNumber: "324 208 001 15 67", image: #imageLiteral(resourceName: "oval"),
                                                                      
                                            onSelected: { [weak moduleOutput] in
                                            moduleOutput?.didChangeAvatar(select: .thirdProfile) })
  private lazy var changeAvatarSection: BaseTableViewSection = {
    BaseTableViewSection(cellModels: [changeAvatarFirstRow, changeAvatarSecondRow,changeAvatarThirdRow ], header: changeAvatarHeader, footer: nil)
  }()
    
  private let interactor: SettingsChangeAvatarInteractorInput
    
  init(interactor: SettingsChangeAvatarInteractorInput,
       moduleOutput: SettingsChangeMyAvatarModuleOutput ) {
    self.interactor = interactor
    self.moduleOutput = moduleOutput
  }
}

extension SettingsChangeAvatarPresenter: SettingsChangeAvatarViewOutput {
  func viewDidLoad() {
    view?.setSections([changeAvatarSection])
  }

  func didSelectAvatar() {
    //
  }
    
  func didSelectDoneButton() {
    coordinator?.dismissViewController()
  }

  func didSelectCloseButton() {
    coordinator?.dismissViewController()
  }
}

extension SettingsChangeAvatarPresenter: SettingsChangeAvatarInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
