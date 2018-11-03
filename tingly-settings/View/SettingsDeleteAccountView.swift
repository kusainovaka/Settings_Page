//
//  SettingsDeleteAccountView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsDeleteAccountView: UIView {

  let alertImage: UIImageView = {
    let image = UIImageView()
    image.image = #imageLiteral(resourceName: "beware")
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  let alertLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 16, weight: .regular)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.text = "DELETING YOUR ACCOUNT WILL:"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let firstRow = SettingsInformationTextView(title: "Delete your account info and profle photo")
  let secondRow = SettingsInformationTextView(title: "Delete you from all WhatsApp groups")
  let thirdRow = SettingsInformationTextView(title: "Delete your message history on this phone and your iCloud backup")

  let alertStackView = UIStackView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(alertImage)
    [alertImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 29),
     alertImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     alertImage.heightAnchor.constraint(equalToConstant: 46),
     alertImage.widthAnchor.constraint(equalToConstant: 54)
    ].forEach { $0.isActive = true }
    
    addSubview(alertLabel)
    [alertLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: 30),
     alertLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38),
     alertLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -38),
     alertLabel.heightAnchor.constraint(equalToConstant: 17)
     ].forEach { $0.isActive = true }
    
    addSubview(alertStackView)
    alertStackView.addArrangedSubview(firstRow)
    alertStackView.addArrangedSubview(secondRow)
    alertStackView.addArrangedSubview(thirdRow)
    
    alertStackView.axis = .vertical
    alertStackView.spacing = 0
    alertStackView.distribution = .fillEqually
    alertStackView.translatesAutoresizingMaskIntoConstraints = false
    
    [alertStackView.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 13),
     alertStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
     alertStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
     alertStackView.heightAnchor.constraint(equalToConstant: 102)
     ].forEach { $0.isActive = true }
    
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
