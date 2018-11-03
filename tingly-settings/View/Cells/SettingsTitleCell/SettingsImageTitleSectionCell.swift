//
//  SettingsMenuFirstSectionCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsImageTitleSectionCell: UITableViewCell {
  
  private var model: SettingsTitleWithImageModel!
  
  private lazy var iconImage: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 15
    return imageView
  }()
  
  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()
  
  private lazy var detailButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "further"), for: .normal)
    return button
  }()
  
  private lazy var backgroundCell: UIView = {
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
    
    backgroundCell.addSubview(iconImage)
    [ iconImage.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      iconImage.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 18),
      iconImage.heightAnchor.constraint(equalToConstant: 33),
      iconImage.widthAnchor.constraint(equalToConstant: 33)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(nameLabel)
    [ nameLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 12),
      nameLabel.widthAnchor.constraint(equalToConstant: 250)
      ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(detailButton)
    [ detailButton.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      detailButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
      detailButton.heightAnchor.constraint(equalToConstant: 23),
      detailButton.widthAnchor.constraint(equalToConstant: 23)
      ].forEach { $0.isActive = true }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    if selected {
      model.onSelected?()
    }
  }
  
}

extension SettingsImageTitleSectionCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleWithImageModel else {
      assertionFailure("wtf???")
      return
    }
    self.model = cellModel
    nameLabel.text = cellModel.text
    iconImage.image = cellModel.image
    nameLabel.textColor = cellModel.textColor
  }
}
