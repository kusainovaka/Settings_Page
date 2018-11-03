//
//  SettingsProfileAboutTextFieldView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 12.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit

protocol ProfileAboutTextCount {
    func getTextCount(count: Int)
}

class SettingsProfileAboutTextFieldView: UIView {
  var delegate: ProfileAboutTextCount?
  lazy var aboutTextField: UITextView = {
  let textfield = UITextView()
    textfield.translatesAutoresizingMaskIntoConstraints = false
    textfield.font = UIFont.ceraRoundFontDisplay(size: 17, weight: .regular)
    textfield.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    textfield.backgroundColor = .clear
    textfield.textAlignment = .left
    textfield.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return textfield
  }()
    
  let placeholderLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.ceraRoundFontDisplay(size: 17, weight: .regular)
    label.textColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
    label.text = "Enter your question here"
    label.backgroundColor = .clear
    label.textAlignment = .left
    return label
  }()
  var limitCount: Int?

  var textCount: Int? {
    didSet {
      guard let text = textCount,
        let limit = limitCount else {
        return
      }
      textCount = limit - text
    }
  }

  init(textCount: Int,placeholderIsHidden: Bool, placheolderText: String) {
  super.init(frame: .zero)
    limitCount = textCount
    placeholderLabel.isHidden = placeholderIsHidden
    placeholderLabel.text = placheolderText
    
    clipsToBounds = false
    backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    layer.cornerRadius = 20
    translatesAutoresizingMaskIntoConstraints = false
    
    addSubview(aboutTextField)
    [aboutTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
    aboutTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
    aboutTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
    aboutTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17)
    ].forEach { $0.isActive = true }
    addSubview(placeholderLabel)
    [placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 23),
     placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
     placeholderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
     placeholderLabel.heightAnchor.constraint(equalToConstant: 17)
        ].forEach { $0.isActive = true }
    
    aboutTextField.becomeFirstResponder()
    aboutTextField.delegate = self
    
    guard placeholderLabel.isHidden else {
        aboutTextField.tintColor = .clear
        return
    }
  }
    
  func aboutText(text: String) {
    aboutTextField.text = text
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SettingsProfileAboutTextFieldView: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
   placeholderLabel.isHidden = !textView.text.isEmpty
   textCount = textView.text.count
   delegate?.getTextCount(count: textCount!)
   guard placeholderLabel.isHidden else {
       aboutTextField.tintColor = .clear
      return
  }
    aboutTextField.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
    
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    guard let textCount = textView.text?.count,
        let limit = limitCount,
        textCount < limit else {
            guard text.isBackspace else { return false }
            return true
    }
    return true
  }
}
