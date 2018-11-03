//
//  SettingsTitleSelectModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleSelectModel: TableViewCellModelProtocol {

  var cellClass: BaseCell.Type = SettingsTitleSelectCell.self
  var height: CGFloat? = 55.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var isSelected: Bool?
  var text: String
  var onSelected: (() -> Void)?

  init(text: String, onSelected: (() -> Void)?, isSelected: Bool? =  false) {
    self.text = text
    self.isSelected = isSelected
    self.onSelected = onSelected
    self.deleteType = .none
  }
}

