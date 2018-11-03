//
//  SettingsAvatarCoinView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 10.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsAvatarCoinView: UIView {
  var levelImage = UIImageView()
  var coinText: UILabel = {
    let label = UILabel()
    label.font = UIFont.ceraRoundFontDisplay(size: 12, weight: .bold)
    label.textAlignment = .center
    return label
  }()
  
  init(level: UIImage, coin:String, color: UIColor) {
    super.init(frame: .zero)
    levelImage.image = level
    coinText.text = coin
    coinText.textColor = color
    
    addSubview(levelImage)
    levelImage.translatesAutoresizingMaskIntoConstraints = false
    [ levelImage.topAnchor.constraint(equalTo: self.topAnchor),
      levelImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      levelImage.heightAnchor.constraint(equalToConstant: 25),
      levelImage.widthAnchor.constraint(equalToConstant: 26)
      
      ].forEach { $0.isActive = true }
    
    addSubview(coinText)
    coinText.translatesAutoresizingMaskIntoConstraints = false
    [ coinText.topAnchor.constraint(equalTo: levelImage.bottomAnchor, constant: 3),
      coinText.leftAnchor.constraint(equalTo: self.leftAnchor),
      coinText.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      coinText.heightAnchor.constraint(equalToConstant: 12)
      ].forEach { $0.isActive = true }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
