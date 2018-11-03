//
//  SettingsHeaderSectionView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsSectionHeaderView: UITableViewHeaderFooterView {
  
  private var model: SettingsHeaderSectionModel!
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    return label
  }()
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(titleLabel)
    titleLabel.font = UIFont.ceraRoundFontDisplay(size: 14, weight: .medium)
    [ titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 15),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
      ].forEach { $0.isActive = true }
  }
}

extension SettingsSectionHeaderView: SectionHeaderFooterView {
  
  func configure(model: SectionHeaderFooterModel) {
    guard let headerModel = model as? SettingsHeaderSectionModel else {
      assertionFailure("WTF??")
      return
    }
    self.model = headerModel
    titleLabel.text = headerModel.text
  }
}
