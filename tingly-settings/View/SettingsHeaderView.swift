//
//  SettingsHeaderView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 02.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import  UIKit

class SettingsHeaderView: UICollectionReusableView {
    
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(titleLabel)
    titleLabel.font = UIFont.ceraRoundFontDisplay(size: 14, weight: .medium)
    [ titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 15),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
        ].forEach { $0.isActive = true }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
