//
//  SettingsTitleWithDescriptionModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleWithDetailDescriptionModel: TableViewCellModelProtocol {
    

  var cellClass: BaseCell.Type = SettingsDetailDescriptionCell.self

  var height: CGFloat? = 55.0
  var deleteType: DeleteType
  var isCollapsed: Bool = false
  var text: String
  var detailText: String
  var onSelected: (() -> Void)?

  init(text: String, detailText: String, onSelected: (() -> Void)?) {
    self.text = text
    self.detailText = detailText
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
