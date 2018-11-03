//
//  SettingsProfileModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

struct SettingsProfileModel: TableViewCellModelProtocol {
  
  var cellClass: BaseCell.Type = SettingsProfileCell.self
  var height: CGFloat? = 74.0
  
  var isCollapsed: Bool = false
  var deleteType: DeleteType

  var text: String
  var profileStatus: String
  var profileImage: UIImage
  var onSelected: (() -> Void)?
  
  init(name: String, status: String, image: UIImage, onSelected: (() -> Void)?) {
    self.text = name
    self.profileStatus = status
    self.profileImage = image
    self.onSelected = onSelected
    self.deleteType = .none
  }
}
