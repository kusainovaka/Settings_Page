//
//  SettingsTitleWithImageModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 07.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleWithImageModel: TableViewCellModelProtocol {
  
  var cellClass: BaseCell.Type = SettingsImageTitleSectionCell.self
  
  var height: CGFloat? = 55.0
  
  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var image: UIImage
  var textColor: UIColor?
  var onSelected: (() -> Void)?
  
  init(text: String, image: UIImage, textColor: UIColor? = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), onSelected: (() -> Void)?) {
    self.text = text
    self.image = image
    self.textColor = textColor
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
