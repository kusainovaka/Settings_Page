//
//  CustomHeaderView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 24.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

enum DoneButtonType {
  case doneButton
  case sendButton
  case nextButton
  case noneButton
}

class CustomHeaderView: UIView {

  var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 22, weight: .regular)
    label.textAlignment = .center
    return label
  }()

  var closeButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "close"), for: .normal)
    return button
  }()

  var doneButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  init(title: String, rightButtonType: DoneButtonType) {
    super.init(frame: .zero)
    backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.6823529412, blue: 0.9098039216, alpha: 1)
    translatesAutoresizingMaskIntoConstraints = false
    layoutsView()
    titleLabel.text = title
    
    switch rightButtonType {
    case .doneButton:
        doneButton.setImage(#imageLiteral(resourceName: "done-white"), for: .normal)
        doneButton.setImage(#imageLiteral(resourceName: "disable-Select"), for: .selected)
    case .sendButton:
        doneButton.setImage(#imageLiteral(resourceName: "send"), for: .normal)
    case .nextButton:
        doneButton.setImage(#imageLiteral(resourceName: "next-arraw"), for: .normal)
    case .noneButton:
        doneButton.removeFromSuperview()
    }
  }

  func layoutsView() {
    addSubview(closeButton)
    [closeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
     closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
     closeButton.heightAnchor.constraint(equalToConstant: 28),
     closeButton.widthAnchor.constraint(equalToConstant: 28)
    ].forEach { $0.isActive = true }
    
    addSubview(doneButton)
    [doneButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
     doneButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21),
     doneButton.heightAnchor.constraint(equalToConstant: 28),
     doneButton.widthAnchor.constraint(equalToConstant: 28)
        ].forEach { $0.isActive = true }
    
    addSubview(titleLabel)
    [titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7),
     titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ].forEach { $0.isActive = true }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
