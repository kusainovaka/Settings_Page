//
//  SettingsStorageProfileView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 27.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsStorageProfileView: UIView {
    
  private lazy var profileImage: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 15
    return imageView
  }()

  private lazy var sizeLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    return label
  }()

  private lazy var messagesLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9490196078, alpha: 1)
    
    addSubview(profileImage)
    [ profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
      profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
      profileImage.heightAnchor.constraint(equalToConstant: 55),
      profileImage.widthAnchor.constraint(equalToConstant: 55)
        ].forEach { $0.isActive = true }
    
    addSubview(sizeLabel)
    [ sizeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
      sizeLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
      sizeLabel.widthAnchor.constraint(equalToConstant: 200)
        ].forEach { $0.isActive = true }
    
    addSubview(messagesLabel)
    [ messagesLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 7),
      messagesLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 13),
      messagesLabel.widthAnchor.constraint(equalToConstant: 200)
    ].forEach { $0.isActive = true }
  }
    
  func profileData(avatar: UIImage, size: String, messages: String) {
    profileImage.image = avatar
    sizeLabel.text = size
    messagesLabel.text = messages
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
