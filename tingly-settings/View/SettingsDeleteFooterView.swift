//
//  SettingsDeleteFooterView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 27.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsDeleteFooterView: UIView {

  let deleteButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.66)
    
    addSubview(deleteButton)
    [deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
     deleteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     deleteButton.heightAnchor.constraint(equalToConstant: 36),
     deleteButton.widthAnchor.constraint(equalToConstant: 36)
    ].forEach { $0.isActive = true }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
