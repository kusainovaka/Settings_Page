//
//  SettingsProfileEditModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsProfileEditModel: TableViewCellModelProtocol {
  
  var cellClass: BaseCell.Type = SettingsProfileEditCell.self
  
  var height: CGFloat? = 158.0
  
  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var image: UIImage
  var onSelected: (() -> Void)?

  
  init(name: String, image: UIImage, onSelected: (() -> Void)?) {
    self.text = name
    self.image = image
    self.deleteType = .none
    self.onSelected = onSelected
  }
}
