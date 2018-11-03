//
//  SettingsTitleSwitcherCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 11.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleSwitcherCell: UITableViewCell {
  private var model: SettingsTitleSwitcherModel!
   var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4666666667, green: 0.4705882353, blue: 0.4705882353, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()

  var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
  }()

  var switcher: UISwitch = {
    let switcher = UISwitch()
    switcher.setOn(true, animated: false)
    switcher.isOn = true
    switcher.onTintColor = #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1)
    switcher.translatesAutoresizingMaskIntoConstraints = false
    switcher.addTarget(self, action: #selector(didValueChange), for: .valueChanged)
    return switcher
  }()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    selectionStyle = .none
    
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
      backgroundCell.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    backgroundCell.layoutIfNeeded()
    
    backgroundCell.addSubview(titleLabel)
    [ titleLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      titleLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -19),
      titleLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 17),
      titleLabel.widthAnchor.constraint(equalToConstant: 260)
        ].forEach { $0.isActive = true }
    
    backgroundCell.addSubview(switcher)
    [ switcher.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
      switcher.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -16),
      switcher.widthAnchor.constraint(equalToConstant: 51)
        ].forEach { $0.isActive = true }
  }

  @objc func didValueChange() {
    guard switcher.isOn else {
        switcher.isOn = true
        return
    }
    switcher.isOn = false
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsTitleSwitcherCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleSwitcherModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    self.titleLabel.text = cellModel.text
    self.switcher.isOn = cellModel.isActive!
  }
}
