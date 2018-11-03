//
//  SettingsAvatarPresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsAvatarPresenter {
  
  weak var view: SettingsAvatarViewInput?
  weak var coordinator: SettingsCoordinatorInput?
  
  private lazy var avatarHeader = SettingsEmptyHeaderModel(height: 2)
  private lazy var firstAvatarRow = SettingsAvatarTitleModel(name: "7 968 214 08 16", image: #imageLiteral(resourceName: "oval"))
  private lazy var secondAvatarRow = SettingsAvatarTitleModel(name: "7 903 765 97 20", image: #imageLiteral(resourceName: "oval"))
  private lazy var thirdAvatarRow = SettingsAvatarTitleModel(name: "7 968 214 08 16", image: #imageLiteral(resourceName: "oval"))

  private lazy var changeAvatarHeader = SettingsEmptyHeaderModel(height: 53)
  private lazy var changeAvatarRow = SettingsTitleWithImageModel(text:"CHANGE AVATAR",image: #imageLiteral(resourceName: "changeAvatar"),textColor: #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1),
                                            onSelected: { [weak coordinator] in
                                            coordinator?.showChangeAvatar(moduleOutput: self)
    
  })
  private lazy var changeAvatarFooter = SettingsFooterSectionModel(text: "Blocked contacts will no longer be able to call you or send you message.")

  private var interactor: SettingsAvatarInteractorInput
  
  init(interactor: SettingsAvatarInteractorInput) {
    self.interactor = interactor
  }
    
  private func buildSections() -> [BaseTableViewSection] {
    let avatarSection = BaseTableViewSection(cellModels: [firstAvatarRow, secondAvatarRow, thirdAvatarRow], header: avatarHeader, footer: nil)
    let changeAvatarSection = BaseTableViewSection(cellModels: [changeAvatarRow], header: changeAvatarHeader, footer: changeAvatarFooter)
    return [avatarSection, changeAvatarSection]
  }
}

extension SettingsAvatarPresenter: SettingsAvatarViewOutput {
  func viewDidLoad() {
    view?.setSections(buildSections())
    
      }
  
  func didSelectAvatar() {
    coordinator?.showChangeAvatar(moduleOutput: self)
  }
  
  func didSelectChangeAvatar() {
    //
  }
}

extension SettingsAvatarPresenter: SettingsChangeMyAvatarModuleOutput {
    func didChangeAvatar(select: MyAvatar) {
      switch select {
      case .firstProfile:
        firstAvatarRow.isSelected = true
        secondAvatarRow.isSelected = false
        thirdAvatarRow.isSelected = false
      case .secondProfile:
        firstAvatarRow.isSelected = false
        secondAvatarRow.isSelected = true
        thirdAvatarRow.isSelected = false
      case .thirdProfile:
        firstAvatarRow.isSelected = false
        secondAvatarRow.isSelected = false
        thirdAvatarRow.isSelected = true
      }
        view?.setSections(buildSections())
    }
    
}

extension SettingsAvatarPresenter: SettingsAvatarInteractorOutput {
  func didReceiveSomeData() {
    //
  }
}
