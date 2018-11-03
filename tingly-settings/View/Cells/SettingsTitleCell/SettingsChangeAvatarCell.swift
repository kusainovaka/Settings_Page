//
//  SettingsChangeAvatarCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsChangeAvatarCell: UITableViewCell {
  private var model: SettingsChangeAvatarModel!

   var isSelect: Bool? {
    didSet {
        guard let select = isSelect,
              select else {
                selectImage.image = #imageLiteral(resourceName: "empty Oval")
                return
        }
        selectImage.image = #imageLiteral(resourceName: "done")
    }
  }

  lazy var profileAvatar: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.layer.cornerRadius = 15
    return imageView
  }()

  lazy var phoneNumber: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 15, weight: .medium)
    return label
  }()

  lazy var selectImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
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
    selectionStyle = .none
    
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(selectImage)
    backgroundCell.addSubview(profileAvatar)
    [ selectImage.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      selectImage.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 18),
      selectImage.heightAnchor.constraint(equalToConstant: 21),
      selectImage.widthAnchor.constraint(equalToConstant: 21)
        ].forEach { $0.isActive = true }
    
    
    backgroundCell.addSubview(profileAvatar)
    [ profileAvatar.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      profileAvatar.leadingAnchor.constraint(equalTo: selectImage.trailingAnchor, constant: 21),
      profileAvatar.heightAnchor.constraint(equalToConstant: 42),
      profileAvatar.widthAnchor.constraint(equalToConstant: 42)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(phoneNumber)
    [ phoneNumber.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      phoneNumber.leadingAnchor.constraint(equalTo: profileAvatar.trailingAnchor, constant: 15),
      phoneNumber.widthAnchor.constraint(equalToConstant: 150)
        ].forEach { $0.isActive = true }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    guard selected  else {
        selectImage.image = #imageLiteral(resourceName: "empty Oval")
        return
    }
    selectImage.image = #imageLiteral(resourceName: "done")
    model.onSelected?()
  }
    
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension SettingsChangeAvatarCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsChangeAvatarModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    phoneNumber.text = cellModel.text
    profileAvatar.image = cellModel.image
    isSelect = cellModel.isSelected!
  }
}
