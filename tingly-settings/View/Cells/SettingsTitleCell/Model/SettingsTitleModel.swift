//
//  SettingsTitleModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleModel: TableViewCellModelProtocol {
  
  var cellClass: BaseCell.Type = SettingsTitleCell.self
  var height: CGFloat? = 55.0
  var deleteType: DeleteType
  var isCollapsed: Bool = false
  var textColor: UIColor?
  var text: String
  var onSelected: (() -> Void)?
    
  init(text: String, textColor: UIColor? = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1) ,onSelected: (() -> Void)?) {
    self.text = text
    self.textColor = textColor
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
