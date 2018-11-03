//
//  SettingsTitleWithDetailButtonModel.swift
//  tingly-settings
//
//  Created by Pavel Shatalov on 05.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsTitleWithDetailButtonModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsTitleWithDetailButtonCell.self
  
  var height: CGFloat? = 55.0
  var deleteType: DeleteType
  var isCollapsed: Bool = false
  var titleColor: UIColor?
  var text: String
  var fontSize: CGFloat?
  var onSelected: (() -> Void)?

    init(text: String, titleColor: UIColor? = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1), fontSize: CGFloat? = 16, onSelected: (() -> Void)?) {
    self.text = text
    self.titleColor = titleColor
    self.onSelected = onSelected
    self.fontSize = fontSize
    self.deleteType = .none
  }
}
