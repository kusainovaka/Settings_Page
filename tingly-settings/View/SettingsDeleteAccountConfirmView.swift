//
//  SettingsDeleteAccountConfirmView.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit
import PhoneNumberKit

class SettingsDeleteAccountConfirmView: UIView {
    
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 16, weight: .medium)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.text = "ENTER YOUR PHONE NUMBER"
    label.textAlignment = .center
    return label
  }()

  let placeholderLabel = UILabel()
  var countryCodeTextView = CorneredTextView()
  var mobileNumberTextView = CorneredTextView()
  var countryTextView = CorneredTextView()

  let attentionLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.acromFontDisplay(size: 14, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.text = "ATTENTION!\nYou will recieve the code via SMS on your mobile phone in order to activate it."
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .center
    return label
  }()
    
  let showAllButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "open"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "show"), for: .selected)
        button.addTarget(self, action: #selector(showAllList), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
  }()

  fileprivate let phoneFormatter = PartialFormatter()
  var shouldShowCountryPicker: (()->())?
  var onChangeNumber: ((_ fulfilled: Bool) -> ())?
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    setupLayout()
    configure()
  }
    
  fileprivate func setupLayout() {
    addSubview(titleLabel)
    [titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 59),
     titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     titleLabel.widthAnchor.constraint(equalToConstant: 250),
     titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ].forEach { $0.isActive = true }
    
    addSubview(countryCodeTextView)
    [countryCodeTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
     countryCodeTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
     countryCodeTextView.widthAnchor.constraint(equalToConstant: 80),
     countryCodeTextView.heightAnchor.constraint(equalToConstant: 46)
        ].forEach { $0.isActive = true }
    
    addSubview(mobileNumberTextView)
    [mobileNumberTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 26),
     mobileNumberTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
     mobileNumberTextView.widthAnchor.constraint(equalToConstant: 190),
     mobileNumberTextView.heightAnchor.constraint(equalToConstant: 46)
        ].forEach { $0.isActive = true }
    
    addSubview(countryTextView)
    [countryTextView.topAnchor.constraint(equalTo: mobileNumberTextView.bottomAnchor, constant: 7),
     countryTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 51),
     countryTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
     countryTextView.heightAnchor.constraint(equalToConstant: 46)
        ].forEach { $0.isActive = true }
    
    addSubview(placeholderLabel)
    placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
    [placeholderLabel.topAnchor.constraint(equalTo: mobileNumberTextView.topAnchor, constant: 13),
     placeholderLabel.leadingAnchor.constraint(equalTo: mobileNumberTextView.leadingAnchor, constant: 19),
     placeholderLabel.widthAnchor.constraint(equalToConstant: 142),
     placeholderLabel.heightAnchor.constraint(equalToConstant: 20)
        ].forEach { $0.isActive = true }
    
    addSubview(attentionLabel)
    [attentionLabel.topAnchor.constraint(equalTo: countryTextView.bottomAnchor, constant: 41),
     attentionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     attentionLabel.widthAnchor.constraint(equalToConstant: 244),
     attentionLabel.heightAnchor.constraint(equalToConstant: 68)
        ].forEach { $0.isActive = true }
    
    addSubview(showAllButton)
    [showAllButton.topAnchor.constraint(equalTo: countryTextView.topAnchor, constant: 20),
     showAllButton.trailingAnchor.constraint(equalTo: countryTextView.trailingAnchor, constant: -18),
     showAllButton.widthAnchor.constraint(equalToConstant: 16),
     showAllButton.heightAnchor.constraint(equalToConstant: 9)
        ].forEach { $0.isActive = true }
  }
    
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    placeholderLabel.text = "000 000 00 00"
    placeholderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.09)
    placeholderLabel.font = UIFont.ceraRoundFontDisplay(size: 20, weight: .medium)
    mobileNumberTextView.delegate = self
    countryTextView.delegate = self
    countryCodeTextView.delegate = self
  }
    
    @objc private func showAllList() {
      showAllButton.isSelected = !showAllButton.isSelected
    }
}


extension SettingsDeleteAccountConfirmView: UITextViewDelegate {

  func textViewDidChange(_ textView: UITextView) {
    if textView == mobileNumberTextView {
        textView.text = phoneFormatter.formatPartial(textView.text)
        placeholderLabel.isHidden = !textView.text.isEmpty
        onChangeNumber?(textView.text.numbers.count == 10)
    }
  }

  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
    if textView == countryTextView || textView == countryCodeTextView {
        shouldShowCountryPicker?()
        return false
    }
    return true
  }

  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let resultString = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
    
    guard !text.isEmpty else { return true }
    
    if textView == mobileNumberTextView {
        return resultString.numbers.count <= 10
    }
    return true
  }
}



