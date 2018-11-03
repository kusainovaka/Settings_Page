//
//  SettingsSectionModel.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 05.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsHeaderSectionModel: SectionHeaderFooterModel {
  
  var text: String?
  var height: CGFloat? = 52.0
  
  var viewClass: TableHeaderFooterView.Type = SettingsSectionHeaderView.self
  
  init(text: String?) {
    self.text = text
  }
  
}
