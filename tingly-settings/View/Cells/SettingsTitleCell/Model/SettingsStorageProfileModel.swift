//
//  SettingsStorageProfileModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 27.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsStorageProfileModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsStorageProfileCell.self

  var height: CGFloat? = 55.0
  var deleteType: DeleteType
  var isCollapsed: Bool = false
  var text: String
  var messageText: String
  var sizeText: String
  var onSelected: (() -> Void)?

  init(type: StorageType, message: String, size: String, onSelected: (() -> Void)?) {
    self.text = type.rawValue
    self.messageText = message
    self.sizeText = size
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
