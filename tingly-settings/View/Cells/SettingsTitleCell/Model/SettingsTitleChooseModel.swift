//
//  SettingsTitleChooseModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 19.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleChooseModel: TableViewCellModelProtocol {

  var cellClass: BaseCell.Type = SettingsTitleChooseCell.self
  var height: CGFloat? = 55.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var isSelected: Bool?
  var text: String
  var onSelected: (() -> Void)?
  var chooseType: Bool?

  init(text: String, onSelected: (() -> Void)?, isSelected: Bool? =  false, chooseType: Bool) {
    self.text = text
    self.isSelected = isSelected
    self.onSelected = onSelected
    self.deleteType = .none
    self.chooseType = chooseType
}
}
