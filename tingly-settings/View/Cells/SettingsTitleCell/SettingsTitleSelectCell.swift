//
//  SettingsSelectCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsTitleSelectCell: UITableViewCell {
  private var model: SettingsTitleSelectModel!

   var isSelect: Bool? {
    didSet {
        guard let select = isSelect,
              select else {
          selectImage.isHidden = true
          return
        }
          selectImage.isHidden = false
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
  
  var selectImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = #imageLiteral(resourceName: "isSelected")
    return image
  }()
    
  private var backgroundCell: UIView = {
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
    
    backgroundCell.addSubview(selectImage)
    selectImage.isHidden = true
    [ selectImage.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 15),
      selectImage.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -19),
      selectImage.heightAnchor.constraint(equalToConstant: 26) ,
      selectImage.widthAnchor.constraint(equalToConstant: 26)
        ].forEach { $0.isActive = true }
  }
    
  override func setSelected(_ selected: Bool, animated: Bool) {
    guard selected else {
      selectImage.isHidden = true
      return
    }
    selectImage.isHidden = false
    model.onSelected?()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsTitleSelectCell: TableViewCellProtocol {
    func configure(model: TableViewCellModelProtocol) {
        guard let cellModel = model as? SettingsTitleSelectModel else {
            assertionFailure("wtf???")
            return
        }
        self.model = cellModel
        nameLabel.text = cellModel.text
        isSelect = cellModel.isSelected!
    }
}
