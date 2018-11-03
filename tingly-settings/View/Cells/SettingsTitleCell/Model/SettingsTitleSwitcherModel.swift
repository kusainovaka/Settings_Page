//
//  SettingsTitleSwitcherModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleSwitcherModel: TableViewCellModelProtocol {
  var cellClass: BaseCell.Type = SettingsTitleSwitcherCell.self

  var height: CGFloat? = 55.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var isActive: Bool?
  init(title: String,isActive: Bool? = false ) {
    self.text = title
    self.isActive = isActive
    self.deleteType = .none
  }
}
