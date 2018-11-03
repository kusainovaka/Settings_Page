//
//  SettingsEmptyHeaderModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsEmptyHeaderModel: SectionHeaderFooterModel {
  
  var text: String? = ""
  var height: CGFloat?
  
  var viewClass: TableHeaderFooterView.Type = SettingsEmptyHeaderCell.self
  
  init(height: CGFloat?) {
    self.height = height
  }
  
}
