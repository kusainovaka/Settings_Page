//
//  SettingsTitleChooseCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 19.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleChooseCell: UITableViewCell {
  private var model: SettingsTitleChooseModel!

  var isSelect: Bool? {
    didSet {
        guard let select = isSelect,
            select else {
                selectImage.isSelected = false
                return
        }
        selectImage.isSelected = true
    }
  }

  var nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 16, weight: .medium)
    return label
  }()

  var selectImage: UIButton = {
    let button = UIButton()
    button.contentMode = .right
    button.setImage(#imageLiteral(resourceName: "isSelected"), for: .selected)
    button.setImage(#imageLiteral(resourceName: "empty"), for: .normal)

    return button
  }()

  var chooseButton: UIButton = {
    let button = UIButton()
    button.contentHorizontalAlignment = .left
    button.setImage(#imageLiteral(resourceName: "empty Oval"), for: .normal)
    button.setImage(#imageLiteral(resourceName: "done"), for: .selected)
    return button
  }()

  private var backgroundCell: UIView = {
    let view = UIView()
    view.clipsToBounds = true
    view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 6
    return view
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
    rowStackView.addArrangedSubview(nameLabel)
    rowStackView.addArrangedSubview(selectImage)
    rowStackView.distribution = .fill
    rowStackView.alignment = .leading
    addSubview(rowStackView)
    [ rowStackView.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -19),
      rowStackView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 13),
      rowStackView.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 20),
      rowStackView.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -14)
        ].forEach { $0.isActive = true }
    
    let nameLabelWidth = UIScreen.main.bounds.width
    guard chooseButton.isHidden else {
        nameLabel.widthAnchor.constraint(equalToConstant: nameLabelWidth - 75).isActive = true
        return
    }
    nameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 30)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    guard selected  else {
        selectImage.isSelected = false
        chooseButton.isSelected = false
        return
    }
    selectImage.isSelected = true
    chooseButton.isSelected = true
    model.onSelected?()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsTitleChooseCell: TableViewCellProtocol {
  func configure(model: TableViewCellModelProtocol) {
    guard let cellModel = model as? SettingsTitleChooseModel else {
        assertionFailure("wtf???")
        return
    }
    self.model = cellModel
    nameLabel.text = cellModel.text
    isSelect = cellModel.isSelected!
    chooseButton.isHidden = !cellModel.chooseType!
    selectImage.isHidden = cellModel.chooseType!
  }
}
