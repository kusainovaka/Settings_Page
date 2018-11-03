//
//  SettingsInformationTextView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 13.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsInformationTextView: UIView {

  let roundView: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1)
    view.layer.cornerRadius = 4
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let textLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 14, weight: .regular)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .left
    return label
  }()

  init(title: String) {
    super.init(frame: .zero)
    backgroundColor = .clear
    translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(roundView)
    [roundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
     roundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
     roundView.heightAnchor.constraint(equalToConstant: 8),
     roundView.widthAnchor.constraint(equalToConstant: 8)
    ].forEach { $0.isActive = true }
    
    addSubview(textLabel)
    textLabel.text = title
    [textLabel.topAnchor.constraint(equalTo: self.topAnchor),
     textLabel.leadingAnchor.constraint(equalTo: roundView.trailingAnchor, constant: 10),
     textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
     textLabel.heightAnchor.constraint(equalToConstant: 34)
    ].forEach { $0.isActive = true }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
