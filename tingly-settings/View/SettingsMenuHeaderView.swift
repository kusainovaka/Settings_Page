//
//  SettingsMenuHeaderView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsMenuHeaderView: UIView {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.ceraRoundFontDisplay(size: 22, weight: .regular)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.text = "MORE"
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1)
    translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(titleLabel)
    [ titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
      ].forEach { $0.isActive = true }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    roundCorners(corners: [.topLeft, .topRight], radius: 18)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
