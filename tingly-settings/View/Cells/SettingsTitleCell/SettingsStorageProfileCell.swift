//
//  SettingsStorageProfileCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 27.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

enum StorageType: String {
    case text = "TEXT"
    case photos = "PHOTOS"
    case voiceMessage = "VOICE MESSAGES"
    case gifs = "GIFS"
}

class SettingsStorageProfileCell: UITableViewCell {

  private var model: SettingsStorageProfileModel!

  private lazy var typeLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()

  private lazy var messageLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    label.widthAnchor.constraint(equalToConstant: 80).isActive = true
    label.font = UIFont.acromFontDisplay(size: 15, weight: .medium)
    return label
  }()

  private lazy var sizeLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    label.widthAnchor.constraint(equalToConstant: 80).isActive = true
    label.font = UIFont.acromFontDisplay(size: 15, weight: .medium)
    return label
  }()

  private lazy  var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
  }()
    
  var chooseButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.contentHorizontalAlignment = .left
    button.setImage(#imageLiteral(resourceName: "empty"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "done"), for: .selected)
    return button
  }()
    
  var rowStackView = UIStackView()

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
    
    backgroundCell.addSubview(rowStackView)
    rowStackView.translatesAutoresizingMaskIntoConstraints = false
    rowStackView.addArrangedSubview(chooseButton)
    chooseButton.isHidden = true
    rowStackView.addArrangedSubview(chooseButton)
    rowStackView.addArrangedSubview(typeLabel)
    rowStackView.addArrangedSubview(messageLabel)
    rowStackView.addArrangedSubview(sizeLabel)

    rowStackView.distribution = .fillProportionally
    rowStackView.alignment = .leading
    addSubview(rowStackView)
    [ rowStackView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -19),
      rowStackView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 13),
      rowStackView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      rowStackView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -14)
        ].forEach { $0.isActive = true }
    chooseButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
    chooseButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    model.onSelected?()
    guard selected else {
        chooseButton.isSelected = false
        return
    }
    chooseButton.isSelected = true
  }
    
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsStorageProfileCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsStorageProfileModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    typeLabel.text = cellModel.text
    messageLabel.text = cellModel.messageText
    sizeLabel.text = cellModel.sizeText
  }
}
