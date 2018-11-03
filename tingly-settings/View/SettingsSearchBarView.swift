//
//  SettingsSearchBarView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 31.08.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

class SettingsSearchBarView: UIView {
  
  lazy var searchBar: UITextField = {
    let textField = UITextField()
    textField.clipsToBounds = true
    textField.layer.cornerRadius = 13
    textField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    textField.font = UIFont.ceraRoundFontDisplay(size: 17, weight: .regular)
    textField.setLeftPaddingPoints(13)
    textField.setRightPaddingPoints(5)
    textField.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    textField.placeholder = "Search"
    return textField
  }()
  
  lazy var searchCloseButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 26, height: 26))
    button.setImage(#imageLiteral(resourceName: "textFieldClose"), for: .normal)
    button.addTarget(self, action: #selector(clearSearchTextAction), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    clipsToBounds = true
    layer.cornerRadius = 6
    searchBar.delegate = self
    
    addSubview(searchBar)
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    [ searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
      searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
      searchBar.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
      searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
      ].forEach { $0.isActive = true }
    searchBar.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    searchBar.rightView = searchCloseButton
    searchCloseButton.isHidden = true
  }
  
  @objc func clearSearchTextAction() {
    searchBar.text = ""
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsSearchBarView: UITextFieldDelegate {
  @objc func textFieldDidChange(_ textField: UITextField) {
    searchCloseButton.isHidden = false
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    searchCloseButton.isHidden = true
  }
}
