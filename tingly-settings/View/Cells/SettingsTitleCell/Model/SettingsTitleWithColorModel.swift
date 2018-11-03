//
//  SettingsTitleWithColorModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleWithColorModel: TableViewCellModelProtocol {
  
  var cellClass: BaseCell.Type = SettingsTitleWithColorCell.self
  
  var height: CGFloat? = 55.0
  
  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var titleColor: UIColor?
  var onSelected: (() -> Void)?
    
  init(text: String, titleColor: UIColor? = #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1), onSelected: (() -> Void)?) {
    self.text = text
    self.titleColor = titleColor
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
