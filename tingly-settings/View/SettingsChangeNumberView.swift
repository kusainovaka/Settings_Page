//
//  SettingsChangeNumberView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsChangeNumberView: UIView {
    
  var oldNumberTexField = EnterMobileNumberTextField(title: "YOUR OLD MOBILE NUMBER")
  var newNumberTexField = EnterMobileNumberTextField(title: "NEW MOBILE NUMBER")
    
  let attentionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 14, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.text = "ATTENTION!\nYou will recieve the code via SMS on your mobile phone in order to activate it."
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .center
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    setupLayout()
  }

  fileprivate func setupLayout() {
   addSubview(oldNumberTexField)
    [oldNumberTexField.topAnchor.constraint(equalTo: self.topAnchor, constant: 39),
     oldNumberTexField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     oldNumberTexField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
     oldNumberTexField.heightAnchor.constraint(equalToConstant: 82)
        ].forEach { $0.isActive = true }
    
    addSubview(newNumberTexField)
    [newNumberTexField.topAnchor.constraint(equalTo: oldNumberTexField.bottomAnchor, constant: 28),
     newNumberTexField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     newNumberTexField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
     newNumberTexField.heightAnchor.constraint(equalToConstant: 82)
        ].forEach { $0.isActive = true }
    
    addSubview(attentionLabel)
    [attentionLabel.topAnchor.constraint(equalTo: newNumberTexField.mobileNumberTextView.bottomAnchor, constant: 41),
     attentionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     attentionLabel.widthAnchor.constraint(equalToConstant: 244),
     attentionLabel.heightAnchor.constraint(equalToConstant: 68)
        ].forEach { $0.isActive = true }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
