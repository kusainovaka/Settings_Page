//
//  SettingsImageTitleWithDetailModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsImageTitleWithDetailModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsImageTitleWithDetailCell.self

  var height: CGFloat? = 55.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var image: UIImage
  var detailText: String
  var onSelected: (() -> Void)?

  init(text: String, image: UIImage, detailText: String, onSelected: (() -> Void)?) {
    self.text = text
    self.image = image
    self.detailText = detailText
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
