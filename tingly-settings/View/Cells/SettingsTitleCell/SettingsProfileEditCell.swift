//
//  SettingsProfileEditCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsProfileEditCell: UITableViewCell {
  private var model: SettingsProfileEditModel!

  private lazy var profileAvatar: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 28
    return imageView
  }()
    
  private lazy var informationLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 12, weight: .medium)
    label.text = "Enter your name and add an optional profile picture"
    return label
  }()
    
  private lazy var profileEditButton: UIButton = {
    let button = UIButton()
    button.setTitle("edit", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.acromFontDisplay(size: 12, weight: .medium)
    button.setTitleColor(#colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1), for: .normal)
    return button
  }()

 private lazy var profileName: UITextField = {
    let textfield = UITextField()
    textfield.textColor = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
    textfield.setRightPaddingPoints(5)
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    return textfield
  }()

  var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
  }()
  
  var nameWordCount: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 18))
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 15, weight: .medium)
    return label
  }()

  var nameCounter: Int? {
    didSet {
        guard let count = nameCounter else {
            return
        }
        nameWordCount.text = "\(25 - count)"
    }
  }
    
  let separatorView = UIView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    backgroundColor = .clear
    
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileAvatar)
    [ profileAvatar.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 11),
      profileAvatar.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 18),
      profileAvatar.heightAnchor.constraint(equalToConstant: 55),
      profileAvatar.widthAnchor.constraint(equalToConstant: 55)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(informationLabel)
    [ informationLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 25),
      informationLabel.leadingAnchor.constraint(equalTo: profileAvatar.trailingAnchor, constant: 13),
      informationLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -47),
      informationLabel.heightAnchor.constraint(equalToConstant: 30)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileEditButton)
    [ profileEditButton.topAnchor.constraint(equalTo: profileAvatar.bottomAnchor, constant: 8),
      profileEditButton.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 34),
      profileEditButton.widthAnchor.constraint(equalToConstant: 23),
      profileEditButton.heightAnchor.constraint(equalToConstant: 14)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(separatorView)
    separatorView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    separatorView.translatesAutoresizingMaskIntoConstraints = false
    [ separatorView.topAnchor.constraint(equalTo: profileEditButton.bottomAnchor, constant: 7),
      separatorView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 19),
      separatorView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: 2)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(profileName)
    profileName.delegate = self
    profileName.rightView = nameWordCount
    [ profileName.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 22),
      profileName.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 17),
      profileName.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -17)
        ].forEach { $0.isActive = true }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsProfileEditCell: TableViewCellProtocol {
    func configure(model: TableViewCellModelProtocol) {
        guard let cellModel = model as? SettingsProfileEditModel else {
            assertionFailure("wtf???")
            return
        }
        self.model = cellModel
        profileName.text = cellModel.text
        profileAvatar.image = cellModel.image
    }
}

extension SettingsProfileEditCell: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    model.onSelected?()
    nameCounter = textField.text?.count
  }
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let textCount = textField.text?.count,
        textCount < 25 else {
          guard string.isBackspace else { return false }
            return true
    }
    nameCounter = textCount + 1
    return true
  }
}
