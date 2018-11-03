//
//  SettingsImageTitleWithDeleteSectionModel.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import Foundation

import UIKit

struct SettingsImageTitleWithDeleteSectionModel: TableViewCellModelProtocol {
    
  var cellClass: BaseCell.Type = SettingsImageTitleWithDeleteSectionCell.self

  var height: CGFloat? = 55.0

  var isCollapsed: Bool = false
  var deleteType: DeleteType
  var text: String
  var image: UIImage
  var onSelected: (() -> Void)?

  init(text: String, image: UIImage,  onSelected: (() -> Void)?) {
    self.text = text
    self.image = image
    self.onSelected = onSelected
    self.deleteType = .unblock
  }
}
