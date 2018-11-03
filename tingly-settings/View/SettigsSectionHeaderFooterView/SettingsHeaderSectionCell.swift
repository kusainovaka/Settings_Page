//
//  SettingsEmptyHeaderCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsEmptyHeaderCell: UITableViewHeaderFooterView {
  
  private var model: SettingsEmptyHeaderModel!
  
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension SettingsEmptyHeaderCell: SectionHeaderFooterView {
  
  func configure(model: SectionHeaderFooterModel) {
    guard let headerModel = model as? SettingsEmptyHeaderModel else {
      assertionFailure("WTF??")
      return
    }
    self.model = headerModel
  }
}

