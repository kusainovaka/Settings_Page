//
//  SettingsTermsOfUsePresenter.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 24.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

class SettingsTermsOfUsePresenter {
  weak var view: SettingsTermsOfUseViewInput?
  weak var coordinator: SettingsCoordinatorInput?

  private lazy var termsOfUseHeader = SettingsEmptyHeaderModel(height: 27)
  private lazy var termsOfUseRow = SettingsTitleWithDetailButtonModel(text: "TERMS OF USE", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var askQuestionRow = SettingsTitleWithDetailButtonModel(text: "ASK A QUESTION", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: {
                                                                    [weak coordinator] in
                                                                    coordinator?.showAskQuestion()
  })

  private lazy var faqHeader = SettingsHeaderSectionModel(text: "FAQ")
  private lazy var confirmRow = SettingsTitleWithDetailButtonModel(text: "HOW TO CONFIRM THE MOBILE NUMBER?", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var borderRow = SettingsTitleWithDetailButtonModel(text: "WHAT IS THE BORDER?", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var willAppearScreenRow = SettingsTitleWithDetailButtonModel(text: "WHAT WILL APPEAR ON THE ME SCREEN?",titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var peopleBehindBorderRow = SettingsTitleWithDetailButtonModel(text: "WHO ARE THE PEOPLE BEHIND BORDER?", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var avatarRow = SettingsTitleWithDetailButtonModel(text: "WHAT AN AVATAR CAN DO?", titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var blockContactRow = SettingsTitleWithDetailButtonModel(text: "HOW TO BLOCK A CONTACT?",titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private lazy var understandMessageRow = SettingsTitleWithDetailButtonModel(text: "TERMS OF USE",titleColor: #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: 14, onSelected: { })
  private let interactor: SettingsTermsOfUseInteractorInput

  init(interactor: SettingsTermsOfUseInteractorInput) {
    self.interactor = interactor
  }

  private func buildSections() -> [BaseTableViewSection] {
    let termOfUse = BaseTableViewSection(cellModels: [termsOfUseRow, askQuestionRow], header: termsOfUseHeader, footer: nil)
    let faq = BaseTableViewSection(cellModels: [confirmRow,borderRow, willAppearScreenRow, peopleBehindBorderRow, avatarRow, blockContactRow, understandMessageRow], header: faqHeader, footer: nil)
        return [termOfUse, faq]
  }
}

extension SettingsTermsOfUsePresenter: SettingsTermsOfUseViewOutput {
  func viewDidLoad() {
   view?.setSections(buildSections())
  }
    
  func didSelectTerOfUse() {
//
  }

  func didSelectAskQuestion() {
//
  }
}

extension SettingsTermsOfUsePresenter: SettingsTermsOfUseInteractorOutput {
    func didReceiveSomeData() {
        //
    }
}
