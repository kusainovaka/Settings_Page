//
//  SettingsTitleWithDetailCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 26.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleWithDetailCell: UITableViewCell {

  private var model: SettingsTitleWithDetailModel!

  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()

  private lazy var detailLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
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
    
    backgroundCell.addSubview(nameLabel)
    [ nameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      nameLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -19),
      nameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 17),
      nameLabel.widthAnchor.constraint(equalToConstant: 250)
    ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(detailLabel)
    [ detailLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      detailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
      detailLabel.widthAnchor.constraint(equalToConstant: 150)
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

extension SettingsTitleWithDetailCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleWithDetailModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    nameLabel.text = cellModel.text
    detailLabel.text = cellModel.detailText
  }
}
