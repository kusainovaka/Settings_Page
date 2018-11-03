//
//  SettingsCustomiseCell.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 01.10.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsCustomiseCell: UICollectionViewCell {
    
  override var isSelected: Bool {
    didSet {
        self.selectButton.isSelected = isSelected
    }
  }
    
  var backgroundImage: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 5
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
    
  var selectButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "selected"), for: .selected)
    return button
  }()
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    
    addSubview(backgroundImage)
    let width = UIScreen.main.bounds.size.width / 2
    [ backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
      backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      backgroundImage.heightAnchor.constraint(equalToConstant: width * 1.4),
      backgroundImage.widthAnchor.constraint(equalToConstant: width - 16 )
        ].forEach { $0.isActive = true }
    
    addSubview(selectButton)
    [ selectButton.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -13),
      selectButton.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -13),
      selectButton.heightAnchor.constraint(equalToConstant: 21),
      selectButton.widthAnchor.constraint(equalToConstant: 21)
        ].forEach { $0.isActive = true }
}
    
  required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
  }
}
