//
//  SettingsMenuProfileCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsProfileCell: UITableViewCell {
  private var model: SettingsProfileModel!

  var profileAvatar: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 28
    return imageView
  }()
  
  var profileName: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    return label
  }()
  
  var profileStatus: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 12, weight: .medium)
    return label
  }()
  
  var profileDetailButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "further"), for: .normal)
    return button
  }()
  
  var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileAvatar)
    [ profileAvatar.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      profileAvatar.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 18),
      profileAvatar.heightAnchor.constraint(equalToConstant: 55),
      profileAvatar.widthAnchor.constraint(equalToConstant: 55)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileName)
    [ profileName.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 19),
      profileName.leadingAnchor.constraint(equalTo: profileAvatar.trailingAnchor, constant: 13),
      profileName.widthAnchor.constraint(equalToConstant: 250)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileStatus)
    [ profileStatus.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 3),
      profileStatus.widthAnchor.constraint(equalTo: profileName.widthAnchor),
      profileStatus.leadingAnchor.constraint(equalTo: profileName.leadingAnchor)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileDetailButton)
    [ profileDetailButton.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      profileDetailButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
      profileDetailButton.widthAnchor.constraint(equalToConstant: 23),
      profileDetailButton.heightAnchor.constraint(equalToConstant: 23)
      ].forEach { $0.isActive = true }
  }
    
  override func setSelected(_ selected: Bool, animated: Bool) {
    if selected {
        model.onSelected?()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }}

extension SettingsProfileCell: TableViewCellProtocol {
    func configure(model: TableViewCellModelProtocol) {
        guard let cellModel = model as? SettingsProfileModel else {
            assertionFailure("wtf???")
            return
        }
        self.model = cellModel
        profileName.text = cellModel.text
        profileStatus.text = cellModel.profileStatus
        profileAvatar.image = cellModel.profileImage
    }
}

