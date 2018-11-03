//
//  SettingsFooterSectionModel.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 05.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit
struct SettingsFooterSectionModel: SectionHeaderFooterModel {
  
  var text: String?
  var height: CGFloat? = nil
  
  var viewClass: TableHeaderFooterView.Type = SettingsSectionFooterView.self
  
  init(text: String?) {
    self.text = text
  }
  
}
