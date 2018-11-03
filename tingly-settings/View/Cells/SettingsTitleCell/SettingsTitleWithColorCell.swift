//
//  SettingsTitleWithColorCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 08.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleWithColorCell: UITableViewCell {

  private var model: SettingsTitleWithColorModel!

  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.9882352941, green: 0.368627451, blue: 0.3333333333, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
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
    backgroundCell.layoutIfNeeded()
    
    backgroundCell.addSubview(nameLabel)
    [ nameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      nameLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -19),
      nameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 17),
      nameLabel.widthAnchor.constraint(equalToConstant: 270)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(detailButton)
    [ detailButton.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      detailButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
      detailButton.heightAnchor.constraint(equalToConstant: 23),
      detailButton.widthAnchor.constraint(equalToConstant: 23)
        ].forEach { $0.isActive = true }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    if selected {
        model.onSelected?()
    }
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsTitleWithColorCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleWithColorModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    nameLabel.text = cellModel.text
    nameLabel.textColor = cellModel.titleColor
  }
}




