//
//  SettingsActiveDevicesCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 14.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsActiveDevicesCell: UITableViewCell {

  private var model: SettingsActiveDevicesModel!
    
  var deviceType: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()

  var platformType: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 14, weight: .medium)
    return label
  }()

  var countryLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 14, weight: .medium)
    return label
  }()

  var statusLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 14, weight: .medium)
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
    addSubview(backgroundCell)
    [ backgroundCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
      backgroundCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
      backgroundCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
      backgroundCell.heightAnchor.constraint(equalToConstant: 77)
        ].forEach { $0.isActive = true }
    backgroundCell.layoutIfNeeded()
    
    addSubview(deviceType)
    [deviceType.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 11),
     deviceType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
     deviceType.widthAnchor.constraint(equalToConstant: 180)
    ].forEach { $0.isActive = true }
    
    addSubview(platformType)
    [platformType.topAnchor.constraint(equalTo: deviceType.bottomAnchor, constant: 2),
     platformType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
     platformType.widthAnchor.constraint(equalToConstant: 180)
    ].forEach { $0.isActive = true }
    
    addSubview(countryLabel)
    [countryLabel.topAnchor.constraint(equalTo: platformType.bottomAnchor, constant: 4),
     countryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
     countryLabel.widthAnchor.constraint(equalToConstant: 180)
    ].forEach { $0.isActive = true }
    
    addSubview(statusLabel)
    [statusLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 13),
     statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
     statusLabel.widthAnchor.constraint(equalToConstant: 180)
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
extension SettingsActiveDevicesCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsActiveDevicesModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    statusLabel.text = cellModel.status
    countryLabel.text = cellModel.country
    platformType.text = cellModel.platformText
    deviceType.text = cellModel.text
  }
}
