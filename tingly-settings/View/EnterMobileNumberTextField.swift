//
//  EnterMobileNumberTextField.swift
//  tingly-settings
//
//  Created by Kamila Kusainova on 15.09.2018.
//  Copyright © 2018 Liquid Gears. All rights reserved.
//

import UIKit
import PhoneNumberKit

protocol SettingsChangeNumberDelegate {
  func didFillingGap(_ settingsChangeView: EnterMobileNumberTextField, fill: Bool)
}

class EnterMobileNumberTextField: UIView {
 var delegate: SettingsChangeNumberDelegate?

 private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.acromFontDisplay(size: 16, weight: .medium)
    label.textColor = #colorLiteral(red: 0.4941176471, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
    label.textAlignment = .center
    return label
  }()

  let placeholderLabel = UILabel()
  var countryCodeTextView = CorneredTextView()
  var mobileNumberTextView = CorneredTextView()
  let countryPlaceholderLabel = UILabel()

  fileprivate let phoneFormatter = PartialFormatter()
  var shouldShowCountryPicker: (()->())?
  var onChangeNumber: ((_ fulfilled: Bool) -> ())?

   init(title: String) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    configure()
    addSubview(titleLabel)
    titleLabel.text = title
    [titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
     titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
     titleLabel.widthAnchor.constraint(equalToConstant: 250),
     titleLabel.heightAnchor.constraint(equalToConstant: 20)
    ].forEach { $0.isActive = true }
    
    addSubview(countryCodeTextView)
    [countryCodeTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
     countryCodeTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
     countryCodeTextView.widthAnchor.constraint(equalToConstant: 80),
     countryCodeTextView.heightAnchor.constraint(equalToConstant: 46)
    ].forEach { $0.isActive = true }
    
    addSubview(mobileNumberTextView)
    [mobileNumberTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
     mobileNumberTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
     mobileNumberTextView.widthAnchor.constraint(equalToConstant: 190),
     mobileNumberTextView.heightAnchor.constraint(equalToConstant: 46)
    ].forEach { $0.isActive = true }
    
    
    addSubview(placeholderLabel)
    placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
    [placeholderLabel.topAnchor.constraint(equalTo: mobileNumberTextView.topAnchor, constant: 13),
     placeholderLabel.leadingAnchor.constraint(equalTo: mobileNumberTextView.leadingAnchor, constant: 19),
     placeholderLabel.widthAnchor.constraint(equalToConstant: 142),
     placeholderLabel.heightAnchor.constraint(equalToConstant: 20)
    ].forEach { $0.isActive = true }
    
    addSubview(countryPlaceholderLabel)
    countryPlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
    [countryPlaceholderLabel.topAnchor.constraint(equalTo: mobileNumberTextView.topAnchor, constant: 13),
     countryPlaceholderLabel.leadingAnchor.constraint(equalTo: countryCodeTextView.leadingAnchor, constant: 19),
     countryPlaceholderLabel.widthAnchor.constraint(equalToConstant: 70),
     countryPlaceholderLabel.heightAnchor.constraint(equalToConstant: 20)
        ].forEach { $0.isActive = true }
  }

  private func configure() {
    placeholderLabel.text = "000 000 00 00"
    placeholderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.09)
    placeholderLabel.font = UIFont.ceraRoundFontDisplay(size: 20, weight: .medium)
    
    countryPlaceholderLabel.text = "000"
    countryPlaceholderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.09)
    countryPlaceholderLabel.font = UIFont.ceraRoundFontDisplay(size: 20, weight: .medium)
    mobileNumberTextView.delegate = self
    countryCodeTextView.delegate = self
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension EnterMobileNumberTextField: UITextViewDelegate {

  func textViewDidChange(_ textView: UITextView) {
    if textView == mobileNumberTextView {
        textView.text = phoneFormatter.formatPartial(textView.text)
        placeholderLabel.isHidden = !textView.text.isEmpty
        onChangeNumber?(textView.text.numbers.count == 10)
    }
    
    if textView == countryCodeTextView {
        textView.text = phoneFormatter.formatPartial(textView.text)
        countryPlaceholderLabel.isHidden = !textView.text.isEmpty
        onChangeNumber?(textView.text.numbers.count == 3)
    }
  }

  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    let resultString = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
    
    guard !text.isEmpty else { return true }
    
    guard resultString.numbers.count == 7 else {
        delegate?.didFillingGap(self, fill: false)
        return true
    }
    delegate?.didFillingGap(self, fill: true)
    if textView == countryCodeTextView {
        return resultString.numbers.count <= 3
    }

    if textView == mobileNumberTextView {
        return resultString.numbers.count <= 7
    }
    
    return true
  }
}
