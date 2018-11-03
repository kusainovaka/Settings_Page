//
//  SettingsActiveDevicesModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 14.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsActiveDevicesModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsActiveDevicesCell.self

  var height: CGFloat? = 77

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var platformText: String
  var status: String
  var country: String
  var onSelected: (() -> Void)?

  init(name: String, platformText: String, status: String, country: String,onSelected: (() -> Void)?) {
    self.text = name
    self.platformText = platformText
    self.country = country
    self.status = status
    self.onSelected = onSelected
    self.deleteType = .delete
  }
}
