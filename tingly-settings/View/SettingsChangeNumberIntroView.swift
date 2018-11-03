//
//  SettingsChangeNumberIntroView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 07.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsChangeNumberIntroView: UIView {
  
  let firstPhoneImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "migration")
    return imageView
  }()
  
  let secondPhoneImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "migration")
    return imageView
  }()
  
  let arrowImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "arrow")
    return imageView
  }()
  
  let imageStacktView = UIStackView()
  
  let changeInformationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 14, weight: .regular)
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let confirmInformationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 14, weight: .regular)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(imageStacktView)
    translatesAutoresizingMaskIntoConstraints = false
    imageStacktView.addArrangedSubview(firstPhoneImage)
    imageStacktView.addArrangedSubview(arrowImage)
    imageStacktView.addArrangedSubview(secondPhoneImage)
    imageStacktView.axis = .horizontal
    imageStacktView.distribution = .fillEqually
    imageStacktView.translatesAutoresizingMaskIntoConstraints = false
    
    [ imageStacktView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 77),
      imageStacktView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 82),
      imageStacktView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -82),
      imageStacktView.heightAnchor.constraint(equalToConstant: 73)
      ].forEach { $0.isActive = true }
    
    addSubview(changeInformationLabel)
    [ changeInformationLabel.topAnchor.constraint(equalTo: imageStacktView.bottomAnchor, constant: 42),
      changeInformationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
      changeInformationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
      changeInformationLabel.heightAnchor.constraint(equalToConstant: 55)
      ].forEach { $0.isActive = true }
    
    addSubview(confirmInformationLabel)
    [ confirmInformationLabel.topAnchor.constraint(equalTo: changeInformationLabel.bottomAnchor, constant: 24),
      confirmInformationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 29),
      confirmInformationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -29),
      confirmInformationLabel.heightAnchor.constraint(equalToConstant: 55)
      ].forEach { $0.isActive = true }
    
    changeInformationLabel.text = "Changing your number will migrate all the information from your account to the new phone number. You can’t undo this change."
    confirmInformationLabel.text = "To proceed, confirm that your new number can receive SMS and tap -> to verify that number."
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
