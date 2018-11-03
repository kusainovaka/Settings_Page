//
//  SettingsTitleCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 09.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleCell: UITableViewCell {

  private var model: SettingsTitleModel!

  private lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 18, weight: .medium)
    return label
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
    selectionStyle = .none
    backgroundCell.addSubview(nameLabel)
    addSubview(backgroundCell)

    NSLayoutConstraint.activate([
      backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      nameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      nameLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -19),
      nameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 17),
      nameLabel.widthAnchor.constraint(equalToConstant: 290)
    ])
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

extension SettingsTitleCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleModel else {
      assertionFailure("wtf???")
      return
    }
    self.model = cellModel
    nameLabel.text = cellModel.text
    nameLabel.textColor = cellModel.textColor
  }
}



