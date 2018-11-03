//
//  SettingsAvatarTitleCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsAvatarTitleCell: UITableViewCell {
  private var model: SettingsAvatarTitleModel!

  override var isSelected: Bool {
    didSet {
        guard isSelected else {
            selectImage.isHidden = true
            return
        }
        selectImage.isHidden = false
    }
  }

  var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
  }()

  var profileAvatar: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 20
    return imageView
  }()

  var profilePhoneNumber: UILabel = {
    let textfield = UILabel()
    textfield.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.font = UIFont.ceraRoundFontDisplay(size: 15, weight: .medium)
    return textfield
  }()

  var selectImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = #imageLiteral(resourceName: "selected")
    return image
  }()

  var starLevel = SettingsAvatarCoinView(level: #imageLiteral(resourceName: "level"), coin: "1000", color: #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1))
  var coinLevel = SettingsAvatarCoinView(level: #imageLiteral(resourceName: "money"), coin: "10000", color: #colorLiteral(red: 0.8862745098, green: 0.7137254902, blue: 0.1529411765, alpha: 1))
  var crystalLevel = SettingsAvatarCoinView(level: #imageLiteral(resourceName: "crystal"), coin: "10000", color: #colorLiteral(red: 0.02745098039, green: 0.8196078431, blue: 0.9607843137, alpha: 1))
  var levelStackView = UIStackView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    selectionStyle = .none
    
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    
    
    backgroundCell.addSubview(profileAvatar)
    [ profileAvatar.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 6),
      profileAvatar.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 18),
      profileAvatar.heightAnchor.constraint(equalToConstant: 42),
      profileAvatar.widthAnchor.constraint(equalToConstant: 42)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(selectImage)
    [ selectImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 6),
      selectImage.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 50),
      selectImage.heightAnchor.constraint(equalToConstant: 20),
      selectImage.widthAnchor.constraint(equalToConstant: 20)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profilePhoneNumber)
    [ profilePhoneNumber.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      profilePhoneNumber.leadingAnchor.constraint(equalTo: profileAvatar.trailingAnchor, constant: 15),
      profilePhoneNumber.widthAnchor.constraint(equalToConstant: 110)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(levelStackView)
    levelStackView.addArrangedSubview(starLevel)
    levelStackView.addArrangedSubview(coinLevel)
    levelStackView.addArrangedSubview(crystalLevel)
    levelStackView.axis = .horizontal
    levelStackView.spacing = 10
    levelStackView.distribution = .fillEqually
    levelStackView.translatesAutoresizingMaskIntoConstraints = false
    
    [ levelStackView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 7),
      levelStackView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -18),
      levelStackView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -7)
        ].forEach { $0.isActive = true }
  }
    
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension SettingsAvatarTitleCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsAvatarTitleModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    self.profileAvatar.image = cellModel.image
    self.profilePhoneNumber.text = cellModel.text
    self.isSelected = cellModel.isSelected!
  }
}
