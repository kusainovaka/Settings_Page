//
//  SettingsAvatarTitleModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsAvatarTitleModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsAvatarTitleCell.self

  var height: CGFloat? = 54.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var image: UIImage
  var isSelected: Bool?

  init(name: String, image: UIImage, isSelected: Bool? = false) {
    self.text = name
    self.image = image
    self.isSelected = isSelected
    self.deleteType = .none
  }
}
