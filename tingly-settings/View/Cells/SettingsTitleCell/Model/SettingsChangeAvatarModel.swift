//
//  SettingsChangeAvatarModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsChangeAvatarModel: TableViewCellModelProtocol {
  var cellClass: BaseCell.Type = SettingsChangeAvatarCell.self

  var height: CGFloat? = 54.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType

  var text: String
  var image: UIImage
  var isSelected: Bool?
  var onSelected: (() -> Void)?

  init(phoneNumber: String, image: UIImage, onSelected: (() -> Void)?, isSelected: Bool? = false) {
    self.text = phoneNumber
    self.image = image
    self.isSelected = isSelected
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
